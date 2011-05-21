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
      redirect_to users_url, notice: 'Your account has been created.'
    else
      flash[:error] = 'Your account could not be created.'
      render :new
    end
  end

  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    params[:user].delete('password') if params[:user]['password'].empty?
    if @user.update_attributes params[:user]
      redirect_to root_url, notice: 'Your account has been updated.'
    else
      flash[:error] = 'Your account could not be updated.'
      render :edit
    end
  end
  
  def destroy
    @user = current_user
    if @user.destroy
      redirect_to root_url, notice: 'Your account has been destroyed. Goodbye.'
    else
      flash[:error] = 'Your account could not be destroyed. Sorry.'
      render :edit
    end
  end
  
end
