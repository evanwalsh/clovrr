require 'spec_helper'

describe PostsController do
  
  before do
    @post = Fabricate :post
  end

  describe "GET /posts" do
    before do
      visit posts_url
    end
    
    it { response.should render_template(:index) }    
    
    it "should give a 200 HTTP response" do
      page.status_code.should eq 200
    end
  end
  
  describe "GET /posts/:url with a valid post" do
    before do
      visit post_url(@post.url)
    end
    
    it { response.should render_template(:show) }
    
    it "should give a 200 HTTP response" do
      page.status_code.should == 200
    end
  end
  
  describe "GET /posts/:url with an invalid post" do
    before do
      visit post_url(@post.url.reverse)
    end
    
    it { response.should render_template('errors/not_found') }
    
    it "should give a 404 HTTP response" do
      page.status_code.should == 404
    end
  end
  
  describe "GET /archive" do
    before do
      visit archive_url
    end
    
    it { response.should render_template(:archive) }
  end
  
  describe "GET /archive/:year" do
    before do
      visit year_archive_url(2011)
    end
    
    it { response.should render_template(:year_archive) }
  end
  
  describe "GET /archive/:year/:month" do
    before do
      visit year_archive_url(2011, 05)
    end
    
    it { response.should render_template(:month_archive) }
  end

end
