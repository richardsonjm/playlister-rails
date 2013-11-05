Generate a New Rails App
`rails new playlister-app -T`

add development and testing gems

```ruby
group :test, :development do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'terminal-notifier-guard'
  gem 'factory_girl'
  gem 'simplecov'
  gem 'database_cleaner'
end
```

Install RSpec
`rails g rspec:install`

Configure our spec_helper

  1. Add SimpleCov
  ```ruby
  require 'simplecov'
  SimpleCov.start
  ```

  2. Comment on Fixtures as we'll use factory_girl
  ```ruby
  # config.fixture_path = "#{::Rails.root}/spec/fixtures"
  ```

  3. Turn off Transactional Fixtures
  ```ruby
  config.use_transactional_fixtures = false
  ```

Create feature_helper.rb in spec

```ruby
require 'spec_helper'
require 'capybara/rails'
```