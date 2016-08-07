source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 5.0.0.beta3', '< 5.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# bootstrap for rails
gem 'bootstrap', '~> 4.0.0.alpha3'
# bootstrap uses tether for absolute positioning
source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.1.0'
end

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.x'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Devise for Authentication
gem 'devise', '~> 4.1'

# simple and extremely flexible way to upload files
gem 'carrierwave', '~> 0.11'
gem 'mini_magick', '~> 4.5'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Rubocop
  gem 'rubocop', require: false
end


group :development do
  # Pry instead of IRB
  gem 'pry'
  gem 'pry-rails'
  gem 'pry-byebug'
  # better errors
  gem "better_errors"
  gem "binding_of_caller"

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console'
  gem 'listen'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen'

  gem 'rspec', '~> 3.5.0.beta1'
  gem 'rspec-core', '~> 3.5.0.beta1'
  gem 'rspec-rails', '~> 3.5.0.beta1'
  gem 'guard-rspec', '~> 4.7', require: false

  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'spring-commands-rspec'
  gem 'vcr'
end

group :test do
  gem 'webmock'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

ruby "2.3.1"
