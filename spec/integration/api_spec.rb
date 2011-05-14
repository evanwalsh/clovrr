require "spec_helper"

describe API do
  
  describe "/api/posts" do    
    before do
      @post = Fabricate :post
      @user = Fabricate :user
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
        post '/api/posts/create', { post: @link_post.attributes, api_key: @user.api_key }
      end
      
      it "should return the post object" do
        puts page.source
      end
    end
  end
  
end