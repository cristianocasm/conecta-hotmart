source 'https://rubygems.org'
ruby '2.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.4'
# Needed for Heroku hosting
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'


# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# >>>>>>>>>>>>>>> Added by Cristiano A. <<<<<<<<<<<<<<<<<<<<<<
group :test, :development do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  # Rspec for testing with specs
  gem 'rspec-rails', '~> 3.0.0'
  # Fixtures for testing with Rspec
  gem 'factory_girl_rails'
  # Matchers for testing with Rspec
  gem 'shoulda-matchers', require: false
  # Capybara simulates real user interactions - helpful when testing views
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
end

group :development do
  # Helps to kill N+1 queries and unused eager loading
  gem "bullet"
  # Creates automatic reports for each view while we navigate through pages
  gem 'rack-mini-profiler'
  # Identifies whether there is any code that is not smelling well
  gem "rails_best_practices"
  # Helps debuggin
  gem 'byebug'
end

group :test do
  # Measures code test coverage
  gem 'simplecov', :require => false
end

group :production do
  # Enable serving assets in production - It was important for hosting at Heroku
  gem 'rails_12factor'
end

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem "therubyracer"
# CSS interpreter
gem "less-rails"
# Style
gem "twitter-bootstrap-rails"
# Easily creates forms integrated with TwitterBoostrap
gem "simple_form"
# Easily creates tables integrated with TwitterBoostrap
gem 'jquery-datatables-rails', github: 'rweng/jquery-datatables-rails'
# Fix some problems related to Turbolinks/JavaScript integration
gem 'jquery-turbolinks'