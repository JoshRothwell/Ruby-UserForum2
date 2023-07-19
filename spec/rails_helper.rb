# spec/rails_helper.rb
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'

# Require support files
Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

# Configure RSpec
RSpec.configure do |config|
  # Use FactoryBot for fixtures
  config.include FactoryBot::Syntax::Methods

  # Use transactional fixtures
  config.use_transactional_fixtures = true

  # Additional configuration options can be added here

  # Define helper methods or custom matchers in spec/support/*.rb
  Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

  # Reset the application state before each test
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end

