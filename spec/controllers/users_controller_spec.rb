require 'spec_helper'

describe UsersController do
  before do
    @user = Fabricate :user
  end

  describe "GET /users" do
    before do
      visit users_url
    end
    
    it { response.should render_template(:index) }    
    
    it "should give a 200 HTTP response" do
      page.status_code.should eq 200
    end
  end
  
  describe "GET /users/:url with a valid user" do
    before do
      visit user_url(@user.username)
    end
    
    it { response.should render_template(:show) }
    
    it "should give a 200 HTTP response" do
      page.status_code.should == 200
    end
  end
  
  describe "GET /users/:username with an invalid user" do
    before do
      visit user_url(@user.username.reverse)
    end
    
    it { response.should render_template('errors/not_found') }
    
    it "should give a 404 HTTP response" do
      page.status_code.should == 404
    end
  end

  describe "GET /users/new" do
    before do
      visit new_user_url
    end
    
    it { response.should render_template(:new) }
    
    it "should give a 200 HTTP response" do
      page.status_code.should == 200
    end
  end
  
  describe "POST /users with a valid user" do
    before do
      post 'create', user: (Fabricate.build(:user))
    end
    
    it "should give a 200 HTTP response" do
      page.status_code.should == 200
    end
    
    it "should redirect to the root" do
      response.should redirect_to root_url
    end
  end
end
