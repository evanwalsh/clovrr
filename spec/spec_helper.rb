require 'simplecov'
SimpleCov.start

require 'spork'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  
  # Hey, Mongoid! Don't cache that class!
  require "rails/mongoid"
  Spork.trap_class_method(Rails::Mongoid, :load_models)
  
  # Hey, Devise! Don't cache that class!
  require "rails/application"
  Spork.trap_method(Rails::Application, :reload_routes!)

  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  
  require 'capybara/rspec'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.mock_with :rspec
    config.include Mongoid::Matchers

    require 'akephalos'
    Capybara.javascript_driver = :akephalos
    
    require 'database_cleaner'  
    config.before(:suite) do    
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.orm = "mongoid"
    end

    config.before(:each) do
      DatabaseCleaner.clean      
    end
  end
end

Spork.each_run do
  # This code will be run each time you run your specs.
end
