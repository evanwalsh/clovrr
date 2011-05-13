class PostsController < ApplicationController
  
  def index
    @posts = Post.desc(:created_at).all
  end
  
  def show
    @post = Post.where(url: params[:id]).first
    if @post.nil?
      not_found
    end
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new params[:post]
    if @post.save
      redirect_to posts_url, notice: 'Post published.'
    else
      flash[:error] = 'Post could not be published.'
      render :new
    end
  end

  def edit
  end

end
