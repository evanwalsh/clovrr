require 'spec_helper'

describe SessionsController do
  
  describe "GET /session/new" do
    before do
      visit sign_in_url
    end
    
    it { response.should render_template(:new) }
    
    it "should give a 200 HTTP response" do
      page.status_code.should == 200
    end
  end
  
  describe "POST /session with a valid session" do
    before do
      post 'session', session: { username: 'the_courier', password: 'warneverchanges' }
    end
    
    it "should give a 200 HTTP response" do
      page.status_code.should == 200
    end
    
    it "should redirect to the root" do
      response.should redirect_to root_url
    end
  end
  
  describe "GET /session/destroy with a session" do
    before do
      post '', session: { username: 'the_courier', password: 'warneverchanges' }
      visit sign_out_url
    end
    
    it "should give a 200 HTTP response" do
      page.status_code.should == 200
    end
    
    it "should redirect to the root" do
      response.should redirect_to root_url
    end
      
  end
end
