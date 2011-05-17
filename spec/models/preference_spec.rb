require 'spec_helper'

describe Preference do
  it { should be_mongoid_document }
  it { should be_timestamped_document }
  it { should be_paranoid_document }
  
  it { should have_field(:name, :value) }
  
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:value) }
  
  describe "in general" do
    before do
      @preference = Fabricate :preference
    end
    
    it "should have a get method that returns a value" do
      Preference.get('site_name').should eq 'Evan Walsh'
    end
  end
end
