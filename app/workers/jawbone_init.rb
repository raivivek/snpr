class JawboneInit
  include Sidekiq::Worker
  sidekiq_options :queue => :jawbone, :retry => 5, :unique => true

  def perform(jawbone_profile_id)
    # init the API Client
    @jawbone_profile = JawboneProfile.find_by_id(jawbone_profile_id)
    @client = client = Jawbone::Client.new @jawbone_profile.token

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
        puts @api_return["data"]["links"]
        end
      else
        break
      end
    end
  end
end
