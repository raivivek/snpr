class SessionsController < ApplicationController
  before_filter :require_user, only: [:create]
  def new
    redirect_to '/auth/jawbone'
  end

  def create
    @user = current_user
    if params[:provider] == "jawbone"
      if @user.jawbone_profile != nil
        @user.jawbone_profile = JawboneProfile.new
      end
      puts request.env["omniauth.auth"]
      render :text => request.env["omniauth.auth"].to_s and return
    end
  end
end
