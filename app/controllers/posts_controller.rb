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
  
  def archive
    if params[:year] and params[:month]
      month_archive
    elsif params[:year]
      year_archive
    else
      @posts = Post.all.group_by { |p| p.created_at.beginning_of_month }
    end
  end
  
  private
    def year_archive
      @posts = Post.where(created_at: { 
        '$gte' => Time.utc(params[:year]), 
        '$lte' => Time.utc(params[:year]).end_of_year 
      })
      render 'year_archive'
    end
    
    def month_archive
      @posts = Post.where(created_at: { 
        '$gte' => Time.utc(params[:year], params[:month]).beginning_of_month, 
        '$lte' => Time.utc(params[:year], params[:month]).end_of_month 
      })
      render 'month_archive'
    end

end
