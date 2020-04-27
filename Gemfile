# frozen_string_literal: true

source 'https://rubygems.org'
ruby '2.6.5'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'aasm'
gem 'activejob-scheduler'
gem 'aws-sdk-s3', require: false
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'bootstrap', '~> 4.3.1'
gem 'coffee-rails', '~> 5.0'
gem 'devise'
gem 'down'
gem 'faker'
gem 'friendly_id', '~> 5.2.4'
gem 'jquery-infinite-pages', path: 'lib/gem/jquery-infinite-pages'
gem 'haml-rails', '~> 2.0'
gem 'http'
gem 'image_processing', '~> 1.2'
gem 'jbuilder', '~> 2.7'
gem 'jquery-rails'
gem 'kaminari'
gem 'keen'
gem 'openssl'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.2', '>= 6.0.2.2'
gem 'sass-rails', '>= 6'
gem 'sidekiq', '< 6.0'
gem 'simple_form'
gem 'sprockets', '~> 4.0'
gem 'uglifier'
gem 'webpacker', '~> 4.0'

group :development, :test do
  # Call "byebug" anywhere in the code to stop execution and get a debugger
  # console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 3.18'
  gem 'factory_bot_rails'
  gem 'pry'
  gem 'rubocop', require: false
  gem 'selenium-webdriver'
end

group :development do
  gem 'capistrano', '~> 3.10', require: false
  gem 'capistrano-bundler', '~> 1.3', require: false
  gem 'capistrano-rails', '~> 1.3', require: false
  gem 'capistrano-sidekiq'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the
  # background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Access an IRB console on exception pages or by using <%= console %>
  # anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end
