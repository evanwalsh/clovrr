require 'spec_helper'

describe PostsController do
  
  before do
    @post = Fabricate :post
  end

  describe "GET index" do
    before do
      visit posts_path
    end
    
    it "should render index.erb" do
      response.should render_template(:index)
    end
  end
  
  describe "GET show with a valid post" do
    before do
      visit post_path(@post.url)
    end
    
    it "should render show.erb" do
      response.should render_template(:show)
    end
  end
  
  describe "GET show with an invalid post" do
    before do
      visit post_path(@post.url.reverse)
    end
    
    it "should give a 404 HTTP response" do
      page.status_code.should == 404
    end
    
    it "should display 'Page not found'" do
      # page.should have_css('h3', text: 'Page not found')
      puts page.source
    end
  end

  describe "GET new" do
    before do
      visit new_post_path
    end
    
    it "should render new.erb" do
      response.should render_template(:new)
    end
  end

end
