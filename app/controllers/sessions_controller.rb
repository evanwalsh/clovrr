class SessionsController < ApplicationController
  def index
    render :new
  end
  
  def new
    
  end
  
  def create
    @session = Session.new params[:session]
    if @session.save
      redirect_to root_url
    else
      flash[:error] = 'Could not authenticate you'
      render :new
    end
  end
  
  def destroy
    
  end
end
