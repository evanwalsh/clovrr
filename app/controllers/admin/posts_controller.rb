class Admin::PostsController < AdminController
  def index
    @posts = Post.desc(:created_at).page(params[:page])
  end

  def new
    @post = Post.new params[:post]
  end
  
  def create
    @post = Post.new params[:post]
    @post.user = current_user
    if @post.save
      redirect_to admin_posts_url, notice: 'Post published.'
    else
      flash[:error] = 'Post could not be published.'
      render :new
    end
  end

  def edit
    @post = Post.where(url: params[:id]).first
  end
  
  def update
    @post = Post.where(url: params[:id]).first
    if @post.update_attributes params[:post]
      redirect_to admin_posts_url, notice: 'Post saved.'
    else
      flash[:error] = 'Post could not be saved.'
      render :edit
    end
  end
  
  def destroy
    @post = Post.where(url: params[:id]).first
    if @post.destroy
      redirect_to admin_posts_url, notice: 'Post destroyed.'
    else
      flash[:error] = 'Post could not be destroyed.'
      render :edit
    end
  end

end
