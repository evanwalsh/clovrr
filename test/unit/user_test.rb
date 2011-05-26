require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # it { should be_mongoid_document }
  # it { should be_timestamped_document }
  # 
  # it { should have_field(:username, :email, :password_digest, :api_key) }
  # it { should have_field(:admin).of_type(Boolean).with_default_value_of(false) }
  # 
  # it { should validate_presence_of(:username) }
  # it { should validate_presence_of(:email) }
  # it { should validate_uniqueness_of(:username) }
  # it { should validate_uniqueness_of(:email) }
  # 
  # it { should have_many(:posts) }
  
  setup do
    @user = Fabricate :user
  end
  
  teardown do
    @user = nil
    DatabaseCleaner.clean
  end
  
  def test_password_setter
    @user.password = "warneverchanges"
    assert_equal @user.password, "warneverchanges"
  end
  
  def test_password_digest
    assert @user.password_digest.present?
  end
  
end
