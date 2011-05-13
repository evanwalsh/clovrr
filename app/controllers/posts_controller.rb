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

end
