require 'spec_helper'

describe User do
  it { should be_mongoid_document }
  it { should be_timestamped_document }
  it { should be_paranoid_document }
  
  it { should have_field(:username, :email, :password_digest) }
  
  it { should validate_uniqueness_of(:username) }
  it { should validate_uniqueness_of(:email) }
  
  
  context "before saving" do
    before :all do
      @user = Fabricate.build :user
    end
    
    it "should let a password be set" do
      @user.should respond_to(:password=)
    end

  end
  
  context "after saving" do
    before :all do
      @user = Fabricate :user
    end
    
    it "should respond to password (with a BCrypt class)" do
      @user.password.class.should be BCrypt::Password
    end
    
    it "should have a password digest" do
      @user.password_digest.present?.should be_true
    end
        
    it "should allow authentication" do
      User.authenticate('the_courier', 'war/never/changes').should eq @user
    end
    
  end
end
