class PostsController < ApplicationController
  
  def index
    @posts = Post.desc(:created_at).page(params[:page])
    respond_to do |format|
      format.atom { 
        @updated = @posts.first.updated_at unless @posts.empty?
        render :layout => false
      }
      format.html
    end
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
      @year = params[:year]
      @posts = Post.year(@year)
      render 'posts/archives/year_archive'
    end
    
    def month_archive
      @year = params[:year]
      @month = params[:month]
      @month_name = monthname(@month)
      @posts = Post.month_of_year(@month, @year)  
      render 'posts/archives/month_archive'
    end
    
    def monthname(monthnumber)  
      if monthnumber  
        Date::MONTHNAMES[monthnumber.to_i]  
      end  
    end

end
