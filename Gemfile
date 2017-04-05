source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
# Use mysql as the database for Active Record
gem 'mysql2', '~> 0.3.18'
gem 'pg', '~> 0.18'
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'twitter-bootstrap-rails'
gem 'bootstrap-sass'
gem "font-awesome-rails"
gem 'mail_form'
gem 'simple_form'

gem 'country_select'

# Use jquery as the JavaScript library
gem 'paperclip'
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc'
gem 'rmagick'

gem 'gibbon'
gem 'omniauth-facebook'
gem 'devise'
gem 'sitemap_generator'

#gem 'mailchimp-api'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'friendly_id'
gem 'figaro'


gem 'rack-cors'
gem 'rack-attack'
gem 'carrierwave', '>= 1.0.0.beta', '< 2.0'
gem 'fog'
gem 'fog-aws'
gem 'aws-sdk'
gem "rails_best_practices"

gem 'will_paginate'
gem 'will_paginate-bootstrap'
gem 'redis'
# Use Unicorn as the app server
# gem 'unicorn'
gem 'ckeditor'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'pry'
  gem 'byebug'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  
  gem 'rails_layout'
  gem 'spring-commands-rspec'
  
end
group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen'
end

group :test do
  gem 'faker'
  gem 'capybara'
  gem 'guard-rspec'
  gem 'launchy'
end

group :production do

  gem 'rails_12factor'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
