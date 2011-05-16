require 'spec_helper'

describe Admin::PreferencesController do
  
  before do
    authenticate!
  end

  describe "GET 'index'" do
    it "should be successful" do
      visit admin_preferences_url
      puts page.source
    end
  end
  
  def authenticate!
    @user = Fabricate(:user, :admin => true)
    cookies[:remember_me] = @user.password_digest
  end

end
