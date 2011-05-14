atom_feed :language => 'en-US' do |feed|
  feed.id nil
  feed.title 'Evan Walsh'
  feed.updated @updated

  @posts.each do |post|
    next if post.updated_at.blank?
    feed.entry(post) do |entry|
      entry.title post.title
      entry.content post.parsed_body, :type => 'html'
      entry.updated(post.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")) 
      entry.author post.user.username
    end
  end
end