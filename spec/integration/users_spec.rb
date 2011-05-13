require "spec_helper"

describe UsersController do
  
  before do
    @user = Fabricate :user
  end
  
  describe "/users" do
    before do
      visit users_path
    end
    
    it "should show the latest users" do
      page.should have_content(@user.username)
    end
  end
  
  describe "/users/:username" do
    before do
      visit user_path(@user.username)
    end
    
    it "should show the user's data" do
      page.should have_content(@user.username)
    end
  end
  
  describe "/users/new" do
    before do
      visit new_user_path
    end
    
    it "should show a form for usering something" do
      page.should have_css("form#new_user")
    end
    
    it "should let me create a user" do
      within('form#new_user') do
        fill_in 'Username', with: 'test123'
        fill_in 'Email', with: "test@example.com"
        fill_in 'Password', with: 'test0123'
        click_button 'Sign up'
      end
      
      page.should have_content('User created.')
    end
    
    describe "the form" do
      it "should have a title and body field" do
        page.should (have_content('Username') and have_content('Email'))
      end
    end
    
  end
  
end