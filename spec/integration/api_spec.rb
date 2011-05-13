require "spec_helper"

describe API do
  
  describe "/api/posts" do    
    before do
      @post = Fabricate :post
      visit '/api/posts'
    end
    
    it "should show all posts in JSON format" do
      page.source.should == Post.all.to_json
    end
    
    describe "/:url" do
      before do
        visit "/api/posts/#{@post.url}"
      end
      
      it "should show the post in JSON format" do
        page.source.should == @post.to_json
      end
    end
    
    describe "/create with a valid post" do
      before do
        @link_post = Fabricate.build :link_post
        post '/api/posts/create', post: @link_post
      end
      
      it "should return the post object" do
        page.source.should have_content(@link_post.title)
      end
    end
  end
  
end