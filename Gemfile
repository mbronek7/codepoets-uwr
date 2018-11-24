# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', git: 'https://github.com/rails/rails.git'

gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'webpacker', github: 'rails/webpacker'

gem 'actiontext', github: 'rails/actiontext', require: 'action_text'
gem 'bcrypt', '~> 3.1', '>= 3.1.12'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'font-awesome-rails'
gem 'image_processing', '~> 1.2' # for Active Storage variants
gem 'jbuilder', '~> 2.5'
gem 'turbolinks', '~> 5'
gem 'jquery-rails', '~> 4.3', '>= 4.3.3'
gem 'friendly_id', '~> 5.2.4'

group :development, :test do
  gem 'annotate', '~> 2.7', '>= 2.7.4'
  gem 'better_errors', '~> 2.5'
  gem 'binding_of_caller'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec', '~> 3.8'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', github: 'rails/web-console'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
