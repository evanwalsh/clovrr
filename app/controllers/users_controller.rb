class UsersController < ApplicationController
  
  before_filter :guests_only!, only: [ :new, :create ]
  before_filter :users_only!, only: [ :edit, :update, :destroy ]
  
  layout 'users'
  
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
  
  def destroy    
  end
  
end
