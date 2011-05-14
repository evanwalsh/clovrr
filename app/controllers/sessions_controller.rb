class SessionsController < ApplicationController
  
  before_filter :guests_only, only: [ :new, :create ]
  before_filter :users_only, only: [ :destroy ]
  
  layout 'users'
  
  def new; end
  
  def create
    @session = Session.new params[:session]
    user = @session.save
    if user
      cookies.permanent.signed[:user_id] = user.id
      flash[:notice] = "Welcome back."
      redirect_to root_url
    else
      flash[:error] = 'Could not authenticate you. Sorry.'
      render :new
    end
  end
  
  def destroy
    if signed_in?
      cookies[:user_id] = nil
      flash[:notice] = 'You are signed out. See ya.'
    else
      flash[:error] = 'Sorry, you are not signed in. Try again, yeah?'
    end
    redirect_to root_url
  end
end
