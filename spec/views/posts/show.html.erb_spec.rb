require 'spec_helper'

describe "posts/show.html.erb" do
  before do
    @post = Fabricate :post
    render
  end
  
  it "should display the post's title" do
    page.should have_content(@post.title)
  end
end
