Fabricator(:post) do
  title 'All long-term problems, at this point.'
  body "Maybe I have been acting different lately.\n\nYeah."
end

Fabricator(:link_post, class_name: :post) do
  title 'Daring Fireball'
  link 'http://daringfireball.net'
  body "My favorite."
end
