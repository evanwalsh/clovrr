atom_feed :language => 'en-US' do |feed|
  def get_url(post)
    if post.link.present?
      post.link
    else
      post_url(post.url)
    end
  end
  
  def get_content(post)
    if post.link.present?
      post.parsed_body+"\n<p>#{link_to('(permalink)', post_url(post.url))}</p>"
    else
      post.parsed_body
    end
  end
  
  feed.title 'Evan Walsh'
  feed.updated @updated

  @posts.each do |post|
    feed.entry(post, url: get_url(post)) do |entry|
      entry.title post.title
      entry.content get_content(post), :type => 'html'
      entry.author do |author|
        author.name post.user.username
      end
    end
  end
end