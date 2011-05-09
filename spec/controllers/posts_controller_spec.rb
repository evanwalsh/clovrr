require 'spec_helper'

describe PostsController do
  
  before do
    @post = Fabricate :post
  end

  describe "GET index", type: :request do
    before do
      visit posts_url
    end
  end
  
  describe "GET show with a valid post", type: :request do
    before do
      visit post_url(@post.url)
    end
    
    it "should display the post's title" do
      page.has_content?(@post.title).should be true
    end
  end
  
  describe "GET show with an invalid post", type: :request do
    before do
      visit post_url(@post.url.reverse)
    end
    
    it "should give a 404 HTTP response" do
      page.status_code.should == 404
    end
  end

  describe "GET new", type: :request do
    before do
      visit new_post_url
    end
  end

end
