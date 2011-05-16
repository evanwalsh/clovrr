require 'spec_helper'

describe AdminController do
  describe "GET /admin with no authentication" do
    before do
      visit admin_url
    end
    
    it { response.should redirect_to(root_url) }    
    
    it "should give a 200 HTTP response" do
      page.status_code.should eq 200
    end
    
    it "should set :error" do
      flash[:error].present?.should be_true
    end
  end
  
  describe "GET /admin with authentication" do
    before do
      authenticate!
      visit admin_url
    end
    
    it { response.should redirect_to(admin_url) }
    it { response.should render_template(:index) }
    
    it "should give a 200 HTTP response" do
      page.status_code.should eq 200
    end
  end
  
  def authenticate!
    @user = Fabricate :user
    cookies[:remember_me] = @user.password_digest
  end
end
