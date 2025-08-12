require "capybara/rspec"
require "selenium/webdriver"

Capybara.server = :puma, { Silent: true }

RSpec.configure do |config|
  config.before(:each, type: :system, js: false) do
    driven_by :rack_test
  end

  config.before(:each, type: :system, js: true) do
    driven_by :selenium_chrome_headless
  end
end
