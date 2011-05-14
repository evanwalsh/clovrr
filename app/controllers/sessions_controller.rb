class SessionsController < ApplicationController
  
  before_filter :guests_only!, only: [ :new, :create ]
  before_filter :users_only!, only: [ :destroy ]
  
  layout 'users'
  
  def new; end
  
  def create
    @session = Session.new params[:session]
    user = @session.save
    if user
      cookies.permanent[:remember_me] = user.password_digest
      flash[:notice] = "Welcome back."
      redirect_to root_url
    else
      flash[:error] = 'Could not authenticate you. Sorry.'
      render :new
    end
  end
  
  def destroy
    cookies[:remember_me] = nil
    flash[:notice] = 'You are signed out. See ya.'
    redirect_to root_url
  end
end
