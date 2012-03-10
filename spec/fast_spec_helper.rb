$:.unshift File.expand_path("../../app/models", __FILE__)

RSpec.configure do |config|
  config.mock_with :rr
end
