class AdminController < ApplicationController
  before_filter :admins_only!
  
  def index
    redirect_to admin_posts_url
  end
end
