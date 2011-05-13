class SessionsController < ApplicationController
  
  layout 'sessions'
  
  def new; end
  
  def create
    @session = Session.new params[:session]
    user = @session.save
    if user
      cookies.permanent.signed[:user_id] = user.id
      flash[:notice] = "Welcome back."
      redirect_to root_url
    else
      flash[:error] = 'Could not authenticate you'
      render :new
    end
  end
  
  def destroy
    if cookies[:user_id]
      cookies[:user_id] = nil
      flash[:notice] = 'You are signed out. See ya.'
    else
      flash[:error] = 'Sorry, you are not signed in. Try again, yeah?'
    end
    redirect_to root_url
  end
end
