
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'shoulda/matchers'
require 'rspec/autorun'
require 'database_cleaner'
require 'capybara/rspec'
require 'capybara'
require 'rails-controller-testing'
require 'pry'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f}


ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Capybara::DSL
  config.include Rails.application.routes.url_helpers
  #config.include Devise::TestHelpers, Type: :controller
  config.order = "random"

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end


#Shoulda::Matchers.configure do |config|
#  config.integrate do |with|

#    with.test_framework :rspec
#    with.library :rails
#  end
#end
