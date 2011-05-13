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
  end
  
end