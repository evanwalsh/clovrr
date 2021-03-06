require "spec_helper"

describe Admin::PostsController do
  
  describe "/admin/posts" do    
    before do
      @post = Fabricate :post
      authenticate!
      visit '/admin/posts'
    end
    
    it "should show posts" do
      # page.should have_content(@post.title)
      puts page.source
    end
    
  end
  
  private
    def authenticate!
      @user = Fabricate :admin_user
      cookies[:remember_me] = @user.password_digest
    end
  
end