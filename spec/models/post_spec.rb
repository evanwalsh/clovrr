require 'spec_helper'

describe Post do
  it { should be_mongoid_document }
  it { should be_timestamped_document }
  it { should be_paranoid_document }
  
  it { should have_field(:title, :url, :body, :parsed_body) }
  
  it { should validate_uniqueness_of(:title) }
  
  it { should respond_to(:reparse_body!) }
  
  context "before saving" do
    before :all do
      @post = Fabricate.build :post
    end
    
    it "should not have a URL" do
      @post.url.blank?.should be true
    end
    
    it "should not have a parsed body" do
      @post.parsed_body.blank?.should be true
    end
  end
  
  context "after saving" do
    before :all do
      @post = Fabricate :post
    end
    
    it "should have a URL that matches its title" do
      @post.url.should eql @post.title.parameterize
    end
    
    it "should have a parsed body" do
      @post.parsed_body.present?.should be true
    end
  end
end
