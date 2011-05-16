class Admin::PostsController < AdminController
  def index
    @posts = Post.all
  end

  def new
  end

  def edit
  end

end
