class PostsController < ApplicationController
  def index
  end
  
  def show
    @post = Post.where(url: params[:url]).first
    if !@post
      not_found
    end
  end

  def new
  end

  def edit
  end

end
