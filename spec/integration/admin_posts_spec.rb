require "spec_helper"

describe Admin::PostsController do
  
  describe "/admin/posts" do    
    before do
      @post = Fabricate :post
      @user = Fabricate :user
      authenticate!
      visit '/admin/posts'
    end
    
    it "should show posts" do
      page.should have_content(@post.title)
    end
    
  end
  
  private
    def authenticate!
      cookies[:remember_me] = @user.password_digest
    end
  
end