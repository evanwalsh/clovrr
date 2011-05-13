require "spec_helper"

describe PostsController do
  
  before do
    @post = Fabricate :post
  end
  
  describe "/posts" do
    before do
      visit posts_path
    end
    
    it "should show the latest posts" do
      page.should (have_content(@post.parsed_body) and have_content(@post.title))
    end
  end
  
  describe "/posts/:url" do
    before do
      visit post_path(@post.url)
    end
    
    it "should show the post's data" do
      page.should (have_content(@post.parsed_body) and have_content(@post.title))
    end
  end
  
end