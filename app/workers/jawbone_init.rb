class JawboneInit
  include Sidekiq::Worker
  sidekiq_options :queue => :jawbone, :retry => 5, :unique => true

  def perform(jawbone_profile_id)
    # init the API Client
    @jawbone_profile = JawboneProfile.find_by_id(jawbone_profile_id)
    @client = client = Jawbone::Client.new @jawbone_profile.token
    begin
    # now let's grab all data for the moves
      @api_return = @client.moves()
      @entries = @api_return["data"]["items"]
      @entries.each do |e|
        @date = e["date"].to_s.to_date
        @moves_entry = JawboneMove.find_or_create_by_jawbone_profile_id_and_date_logged(@jawbone_profile.id, @date)
        @steps = e["details"]["steps"]
        @distance = e["details"]["distance"]
        @moves_entry.steps = @steps
        @moves_entry.distance = @distance
        @moves_entry.date_logged = @date
        @moves_entry.save
        puts "jawbone:saved first moves"
      end

      # ok, and now even more data if we didn't get all already
      while @api_return["data"].key? "links"
        if @api_return["data"]["links"].key? "next"
          @next_url_params = Rack::Utils.parse_query URI(@api_return["data"]["links"]["next"]).query
          @api_return = client.moves({"page_token":@next_url_params["page_token"]})
          @entries = @api_return["data"]["items"]
          @entries.each do |e|
            @date = e["date"].to_s.to_date
            @moves_entry = JawboneMove.find_or_create_by_jawbone_profile_id_and_date_logged(@jawbone_profile.id, @date)
            @steps = e["details"]["steps"]
            @distance = e["details"]["distance"]
            @moves_entry.steps = @steps
            @moves_entry.distance = @distance
            @moves_entry.date_logged = @date
            @moves_entry.save
            puts "jawbone:saved next moves"
          end
        else
          break
        end
      end
    rescue => e
      logger.error("Failed with #{e.class}: #{e.message}")
    end

    begin
      # now let's repeat this with the weight data
      @api_return = @client.body_events()
      @entries = @api_return["data"]["items"]
      @entries.each do |e|
        @date = e["date"].to_s.to_date
        @weights_entry = JawboneWeight.find_or_create_by_jawbone_profile_id_and_date_logged(@jawbone_profile.id, @date)
        @weight = e["details"]["weight"]
        @bmi = e["details"]["bmi"]
        @body_fat = e["details"]["body_fat"]
        @weights_entry.weight = @weight
        @weights_entry.bmi = @bmi
        @weights_entry.body_fat = @body_fat
        @weights_entry.date_logged = @date
        @weights_entry.save
        puts "jawbone:saved first bodies"
      end

      # still reading this? perfect, so let's again iterate over all the next pages that might be there
      while @api_return["data"].key? "links"
        if @api_return["data"]["links"].key? "next"
          @next_url_params = Rack::Utils.parse_query URI(@api_return["data"]["links"]["next"]).query
          @api_return = client.body_events({"page_token":@next_url_params["page_token"]})
          @entries = @api_return["data"]["items"]
          @entries.each do |e|
            @date = e["date"].to_s.to_date
            @weights_entry = JawboneWeight.find_or_create_by_jawbone_profile_id_and_date_logged(@jawbone_profile.id, @date)
            @weight = e["details"]["weight"]
            @bmi = e["details"]["bmi"]
            @body_fat = e["details"]["body_fat"]
            @weights_entry.weight = @weight
            @weights_entry.bmi = @bmi
            @weights_entry.body_fat = @body_fat
            @weights_entry.date_logged = @date
            @weights_entry.save
            puts "jawbone:saved next bodies"
          end
        end
      end
    rescue => e
      logger.error("Failed with #{e.class}: #{e.message}")
    end

    begin
      # and one last time, now we go for sleep data
      @api_return = @client.sleeps()
      @entries = @api_return["data"]["items"]
      @entries.each do |e|
        @date = e["date"].to_s.to_date
        @sleeps_entry = JawboneSleep.find_or_create_by_jawbone_profile_id_and_date_logged(@jawbone_profile.id, @date)
        @awake = e["details"]["awake"]
        @duration = e["details"]["duration"]
        @times_awake = e["details"]["awakenings"]
        @sleeps_entry.awake = @awake
        @sleeps_entry.duration = @duration
        @sleeps_entry.times_awake = @times_awake
        @sleeps_entry.date_logged = @date
        @sleeps_entry.save
        puts "jawbone:saved first sleep"
      end

      # still reading this? perfect, so let's again iterate over all the next pages that might be there
      while @api_return["data"].key? "links"
        puts @api_return
        if @api_return["data"]["links"].key? "next"
          @next_url_params = Rack::Utils.parse_query URI(@api_return["data"]["links"]["next"]).query
          puts @next_url_params
          @api_return = client.sleeps({"page_token":@next_url_params["page_token"]})
          @entries = @api_return["data"]["items"]
          @entries.each do |e|
            @date = e["date"].to_s.to_date
            @sleeps_entry = JawboneSleep.find_or_create_by_jawbone_profile_id_and_date_logged(@jawbone_profile.id, @date)
            @awake = e["details"]["awake"]
            @duration = e["details"]["duration"]
            @times_awake = e["details"]["awakenings"]
            @sleeps_entry.awake = @awake
            @sleeps_entry.duration = @duration
            @sleeps_entry.times_awake = @times_awake
            @sleeps_entry.date_logged = @date
            @sleeps_entry.save
            puts "jawbone:saved more sleep"
          end
        end
      rescue => e
        logger.error("Failed with #{e.class}: #{e.message}")
      end
    end
    puts "jawbone:done all"
  end

  def logger
    return @logger if @logger
    @logger = Logger.new(Rails.root.join("log/jawbone_#{Rails.env}.log"))
    @logger.formatter = Logger::Formatter.new
    @logger
  end

  def send_logged(method)
    start_time = Time.now
    ret = send(method)
    took = Time.now - start_time
    logger.info("calling of method `#{method}` took #{took} s")
    ret
  end

end
