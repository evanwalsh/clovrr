Fabricator(:user) do
  username 'the_courier'
  email 'the_courier@new.vegas.net'
  password 'warneverchanges'
end

Fabricator(:admin_user, class_name: :user) do
  username 'house'
  email 'admin@house.net'
  password 'thehousealwayswins'  
  admin true
end