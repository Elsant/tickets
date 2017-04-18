source 'https://rubygems.org'
ruby "2.4.0"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.0.rc1'
gem 'mysql2', '>= 0.3.18', '< 0.5'
gem 'puma', '~> 3.7'

gem 'sass-rails', github: "rails/sass-rails"
gem 'slim-rails', '~> 3.1', '>= 3.1.2'
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'

gem 'uglifier', '>= 1.3.0'
gem 'webpacker', github: 'rails/webpacker'
gem 'coffee-rails', '~> 4.2'

gem 'jbuilder', '~> 2.5'

group :development, :test do
  gem "awesome_print"
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13.0'
  gem 'selenium-webdriver'
  gem 'rspec-rails', '~> 3.5', '>= 3.5.2'
  gem 'factory_girl_rails'
  gem "faker"
  gem 'simplecov', '~> 0.14.1', :require => false, :group => :test

  gem 'any_login'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner'
  gem "fuubar"
  gem 'shoulda-matchers', '~> 3.1'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'dotenv-rails', '~> 2.2'
gem 'devise', '~> 4.2', '>= 4.2.1'
gem 'foreman', '~> 0.84.0'

gem 'simple_form', '~> 3.4'
gem 'rails_admin', '~> 1.1', '>= 1.1.1'
gem 'erubis', '~> 2.7'
gem 'prawn', '~> 2.2', '>= 2.2.2'
gem 'prawn-table', '~> 0.2.2'