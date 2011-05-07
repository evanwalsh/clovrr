class PostsController < ApplicationController
  def index
  end
  
  def show
    @post = Post.where(url: params[:id]).first
    if @post.blank?
      not_found
    end
  end

  def new
  end

  def edit
  end

end
