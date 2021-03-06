require 'spec_helper'

describe Post do
  it { should be_mongoid_document }
  it { should be_timestamped_document }
  
  it { should have_field(:title, :url, :body, :parsed_body, :link) }
  
  it { should validate_uniqueness_of(:title) }
  it { should validate_presence_of(:title) }
  
  it { should belong_to(:user) }
  
  it { should respond_to(:reparse_body!) }
  it { should respond_to(:kind) }
  
  context "a text post" do
    context "before saving" do
      before do
        @post = Fabricate.build :post
      end
      
      it "should have a title" do
        @post.title.present?.should be true
      end

      it "should not have a URL" do
        @post.url.blank?.should be true
      end

      it "should not have a parsed body" do
        @post.parsed_body.blank?.should be true
      end
      
      it "should not have a link" do
        @post.link.blank?.should be true
      end
      
      it "#kind should return 'text'" do
        @post.kind.should eq 'text'
      end
    end

    context "after saving" do
      before do
        @post = Fabricate :post
      end
      
      it "should have a title" do
        @post.title.present?.should be true
      end

      it "should have a URL that matches its title" do
        @post.url.should == @post.title[0, 32].parameterize
      end

      it "should have a parsed body" do
        @post.parsed_body.present?.should be true
      end
      
      it "should not have a link" do
        @post.link.blank?.should be true
      end
      
      it "#kind should return 'text'" do
        @post.kind.should eq 'text'
      end
    end
  end
  
  context "a link post" do
    context "before saving" do
      before do
        @post = Fabricate.build :link_post
      end

      it "should not have a URL" do
        @post.url.blank?.should be true
      end
      
      it "should have a link" do
        @post.link.present?.should be true
      end
      
      it "should have a title" do
        @post.title.present?.should be true
      end
      
      it "#kind should return 'link'" do
        @post.kind.should eq 'link'
      end
    end

    context "after saving" do
      before do
        @post = Fabricate :link_post
      end
      
      it "should have a title" do
        @post.title.present?.should be true
      end

      it "should have a URL that matches its title" do
        @post.url.should == @post.title.parameterize
      end

      it "should have a parsed body" do
        @post.parsed_body.present?.should be true
      end
      
      it "should have a link" do
        @post.link.present?.should be true
      end
      
      it "#kind should return 'link'" do
        @post.kind.should eq 'link'
      end
    end
  end
end
