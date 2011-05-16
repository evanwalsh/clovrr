require "spec_helper"

describe Admin::PreferencesController do
  
  describe "/admin/preferences" do    
    before do
      authenticate!
      @post = Fabricate :post
      visit '/admin/posts'
    end
    
    it "should show posts" do
      page.should have_content(@post.title)
    end
    
  end
  
  private
    def authenticate!
      @user = Fabricate :admin_user
      cookies[:remember_me] = @user.password_digest
    end
  
end