require 'support/helpers/capybara_helpers'
RSpec.configure do |config|
  config.include Features::CapybaraHelpers, type: :feature
end
