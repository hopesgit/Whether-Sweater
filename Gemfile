source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'bundler', '>= 2.1.4'
gem 'rails', '~> 5.2.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'fast_jsonapi'
gem 'figaro'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'faraday'
gem 'bcrypt'

group :development, :test do
  gem 'pry'
  gem 'factory_bot_rails'
  gem 'faker'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop', '~> 1.13', require: false
end

group :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'webmock'
  gem 'vcr'
  gem 'simplecov'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
