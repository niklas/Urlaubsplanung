source 'http://rubygems.org'

gem 'rails', '3.1.0.rc5'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "~> 3.1.0.rc"
  gem 'coffee-rails', "~> 3.1.0.rc"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end
gem "pg"
gem "haml-rails"
gem "inherited_resources", "~> 1.2.2"
gem "simple_form", "~> 1.4.2"
gem "devise"
gem "cancan"
gem "therubyracer", "~> 0.9.2"
gem "jquery-rails"
gem "coffee-script"
gem "nifty-generators"
gem "capistrano", :group => :development
gem "rspec-rails", "~> 2.6.1.beta.1", :group => :test
gem "capybara", "~> 1.0.0", :group => :test
gem "cucumber", :group => :test
gem "cucumber-rails", :group => :test
gem "pickle", :group => :test
gem "timecop", :group => :test
gem "autotest", :group => :test
gem "launchy", :group => :test
gem "database_cleaner", "~> 0.6.7", :group => :test
gem "factory_girl_rails", "~> 1.1.0", :group => :test
gem "spork", "~> 0.9.0.rc2", :group => :test
gem "email_spec", :group => :test
gem "fuubar-cucumber", :group => :test

group :development, :test do
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-cucumber'
  gem 'guard-spork'
  gem 'libnotify'

  gem 'pry'
end
