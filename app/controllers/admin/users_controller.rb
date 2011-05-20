class Admin::UsersController < AdminController
  def index
    @users = User.desc(:created_at).page(params[:page])
  end

  def new
    @user = User.new params[:user]
  end
  
  def create
    @user = User.new params[:user]
    if @user.save
      redirect_to admin_users_url, notice: 'User created.'
    else
      flash[:error] = 'User could not be created.'
      render :new
    end
  end

  def edit
    @user = User.where(username: params[:id]).first
  end
  
  def update
    @user = User.where(username: params[:id]).first
    if @user.update_attributes params[:user]
      redirect_to admin_users_url, notice: 'User saved.'
    else
      flash[:error] = 'User could not be saved.'
      render :edit
    end
  end
  
  def destroy
    @user = User.where(username: params[:id]).first
    if @user.destroy
      redirect_to admin_users_url, notice: 'User destroyed.'
    else
      flash[:error] = 'User could not be destroyed.'
      render :edit
    end
  end

end
