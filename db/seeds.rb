# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

preferences = {
  site_name: 'My blog.'
  site_tagline:	'This is it.'
  author_name: 'Clovrr User'
  theme: 'default'
}

preferences.each do |name, value|
  Preference.create({ name: name, value: value })
end

User.create({ username: 'admin', email: 'change_me@example.com', password: 'admin' })