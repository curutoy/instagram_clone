source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3'
gem 'aws-sdk-s3', '1.46.0', require: false
#content_type: size:を指定できる
gem 'active_storage_validations', '~> 0.8.2'
gem 'bootstrap-sass', '~> 3.4.1'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
gem 'devise'
gem 'devise-i18n'
gem 'dotenv-rails'
#サンプルデータを自動で作成
gem 'faker',  '~> 2.1.1'
#ImageMagickの加工の部分を担う
gem 'image_processing',           '~> 1.9.3'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.7'
#ImageMagickをRuby側で使えるようにする
gem 'mini_magick',                '~> 4.9.5'
gem 'omniauth'
gem 'omniauth-facebook'
# Use Puma as the app server
gem 'puma', '~> 4.1'
gem 'rails-i18n', '~> 6.0'
gem 'rails-controller-testing'
#検索機能
gem 'ransack'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  #テスト用のDBを作成
  gem "factory_bot_rails"
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-byebug'
  gem "rspec-rails"
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '~> 1.4'
end

group :development do
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

group :production do
  gem 'pg', '1.1.4'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
