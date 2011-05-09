require 'spec_helper'

describe PostsController do
  
  before do
    @post = Fabricate :post
  end

  describe "GET index", type: :request do
    before do
      visit posts_path
    end
  end
  
  describe "GET show with a valid post", type: :request do
    before do
      visit post_path(@post.url)
    end
    
    it "should display the post's title" do
      page.should have_content(@post.title)
    end
  end
  
  describe "GET show with an invalid post", type: :request do
    before do
      visit post_path(@post.url.reverse)
    end
    
    it "should give a 404 HTTP response" do
      page.status_code.should == 404
    end
  end

  describe "GET new", type: :request do
    before do
      visit new_post_path
    end
  end

end
