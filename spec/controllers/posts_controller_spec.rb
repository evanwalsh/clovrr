require 'spec_helper'

describe PostsController do
  
  before do
    @post = Fabricate :post
  end

  describe "GET index" do
    it "should be successful" do
      visit posts_path
      response.should be_success
    end
  end
  
  describe "GET show with a valid post" do    
    it "should be successful" do
      visit post_path(@post.url)
      response.should be_success
    end
  end
  
  describe "GET show with an invalid post" do
    it "should be unsuccessful" do
      visit post_path(@post.url.reverse)
      response.should be
    end
  end

  describe "GET new" do
    it "should be successful" do
      visit new_post_path
      response.should be_success
    end
  end

end
