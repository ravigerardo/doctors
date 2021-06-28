source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.2"

gem "rails", "~> 6.0"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 4.3"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "bootsnap", ">= 1.1.0", require: false

gem "bulma-extensions-rails"
gem "bulma-rails", "~> 0.7.1"
gem "cocoon"
gem "devise"
gem "ffaker"
gem "font-awesome-sass", "~> 5.3.1"
gem "haml-rails", "~>2.0"
gem "jquery-rails"
gem "kaminari"
gem "pundit"
gem "simple_form"
gem "trix-rails", require: "trix"
gem "unicorn"
gem "wicked_pdf"
gem "wkhtmltopdf-binary", "0.12.3"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "pry-rails"
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "shoulda-matchers"
  gem "capybara"
  gem "webdrivers", require: false
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
