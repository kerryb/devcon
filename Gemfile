source "http://rubygems.org"

gem "rails", "3.2.2"

gem "simple_form"
gem "twitter_bootstrap_form_for",
  git: "https://github.com/stouset/twitter_bootstrap_form_for.git",
  branch: "bootstrap-2.0"
gem "twitter-bootstrap-rails"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem "sass-rails"
  gem "coffee-rails"
  gem "uglifier"
end

gem "jquery-rails"

group :test, :development do
  gem "capybara-screenshot"
  gem "capybara-webkit"
  gem "cucumber-rails", require: false
  gem "fuubar"
  gem "fuubar-cucumber", require: "cucumber/formatter/fuubar"
  gem "heroku"
  gem "launchy"
  gem "rspec-rails"
end
