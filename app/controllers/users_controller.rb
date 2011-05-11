class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.where(username: params[:id]).first
    if @user.nil?
      not_found
    end
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new params[:user]
    if @user.save
      redirect_to users_url, notice: 'User created.'
    else
      flash[:error] = 'User could not be created.'
      render :new
    end
  end

  def edit
  end
  
end