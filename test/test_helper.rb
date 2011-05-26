ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  require 'database_cleaner'
  DatabaseCleaner.strategy = :truncation
  DatabaseCleaner.orm = "mongoid"
end