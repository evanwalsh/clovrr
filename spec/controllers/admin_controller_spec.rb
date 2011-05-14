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
end
