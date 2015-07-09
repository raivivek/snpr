class SessionsController < ApplicationController
  before_filter :require_user, only: [:create]
  def new
    redirect_to '/auth/jawbone'
  end

  def create
    @user = current_user
    puts request.env["omniauth.auth"]
    if params[:provider].starts_with?"jawbone"
      if @user.jawbone_profile == nil
        @user.jawbone_profile = JawboneProfile.new
        @user.jawbone_profile.save
      end
      @jawbone_profile = @user.jawbone_profile
      @jawbone_profile.token = request.env["omniauth.auth"]["credentials"]["token"]
      @jawbone_profile.refresh_token = request.env["omniauth.auth"]["credentials"]["refresh_token"]
      @jawbone_profile.jawbone_user_id = request.env["omniauth.auth"]["uid"]
      @jawbone_profile.expires_at = Time.at(request.env["omniauth.auth"]["credentials"]["expires_at"]).to_datetime
      @jawbone_profile.save
      JawboneInit.perform_async(@jawbone_profile.id)
      puts request.env["omniauth.auth"]
      render :text => request.env["omniauth.auth"].to_s and return
    end
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end
end
