require 'spec_helper'

describe User do
  it { should be_mongoid_document }
  it { should be_timestamped_document }
  it { should be_paranoid_document }
  
  it { should have_field(:username, :email, :password_digest) }
  it { should have_field(:admin).of_type(Boolean).with_default_value_of(false) }
  
  it { should validate_uniqueness_of(:username) }
  it { should validate_uniqueness_of(:email) }
  
  context "before saving" do
    before do
      @user = Fabricate.build :user
    end
    
    it "should allow a password to be set" do
      @user.password = "warneverchanges"
      @user.password.should eq "warneverchanges"
    end
    
    it "should have password digest" do
      @user.password_digest.present?.should be_true
    end
  end
  
  context "after saving" do
    before do
      @user = Fabricate :user
    end
    
    it "should have a password digest" do
      @user.password_digest.present?.should be_true
    end
    
  end
  
  context "authenticating" do
    before do
      @user = Fabricate :user
    end
    
    it "should return a User object when called with valid creds" do
      User.authenticate('the_courier', 'warneverchanges').should == @user
    end
    
  end
end