require "spec_helper"

describe PostsController do
  
  before do
    @post = Fabricate :post
  end
  
  describe "/posts" do
    before do
      visit posts_path
    end
    
    it "should show the latest posts" do
      page.should (have_content(@post.parsed_body) and have_content(@post.title))
    end
  end
  
  describe "/posts/:url" do
    before do
      visit post_path(@post.url)
    end
    
    it "should show the post's data" do
      page.should (have_content(@post.parsed_body) and have_content(@post.title))
    end
  end
  
  describe "/posts/new" do
    before do
      visit new_post_path
    end
    
    it "should show a form for posting something" do
      page.should have_css("form#new_post")
    end
    
    it "should let me create a post" do
      within('#new_post') do
        fill_in 'Title', with: 'Do it.'
        fill_in 'Body', with: 'RIGHT.'
        click_button 'Publish'
      end
    end
      
    end
    
    describe "the form" do
      it "should have a title and body field" do
        page.should (have_content('Title') and have_content('Body'))
      end
    end
  end
  
end