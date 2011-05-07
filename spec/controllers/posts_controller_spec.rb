require 'spec_helper'

describe PostsController do
  
  before do
    @post = Fabricate :post
  end

  describe "GET index" do
    it "should render index.erb" do
      visit posts_path
      response.should render_template(:index)
    end
  end
  
  describe "GET show with a valid post" do    
    it "should render show.erb" do
      visit post_path(@post.url)
      response.should render_template(:show)
    end
  end
  
  describe "GET show with an invalid post" do
    it "should be unsuccessful" do
      visit post_path(@post.url.reverse)
      response.code.should eq 404
    end
  end

  describe "GET new" do
    it "should render new.erb" do
      visit new_post_path
      response.should render_template(:new)
    end
  end

end
