class PostsController < ApplicationController
  respond_to :html, :json
  
  def index
    @posts = Post.desc(:created_at).all
    respond_with @posts
  end
  
  def show
    @post = Post.where(url: params[:id]).first
    if @post.nil?
      not_found
    end
  end

  def new
    @post = Post.new
    respond_with @post
  end
  
  def create
    @post = Post.new params[:post]
    if @post.save
      redirect_to posts_url, notice: 'Post published.'
    else
      flash[:error] = 'Post could not be published.'
      render :new
    end
    
    respond_with @post
  end

  def edit
  end

end
