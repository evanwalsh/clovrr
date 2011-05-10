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

  describe "GET /posts/new" do
    before do
      visit new_post_url
    end
    
    it { response.should render_template(:new) }
    
    it "should give a 200 HTTP response" do
      page.status_code.should == 200
    end
  end
  
  describe "POST /posts with a valid post" do
    before do
      post 'create', post: { title: 'Post Title', body: 'Well. All right.' }
    end
    
    it { response.should render_template(:index) }
    # it { response.should redirect_to posts_url }
    
    it "should give a 200 HTTP response" do
      page.status_code.should == 200
    end
    
    it "should display the new post" do
      response.should redirect_to posts_url
      # page.should (have_content('Post Title') and have_content('Well. All right.'))
      puts page.source
    end
  end

end
