# ======== Set Load Paths ======
support_dir = File.dirname(__FILE__)
path_to_root = File.join(support_dir, '/../../')
$LOAD_PATH.unshift File.expand_path(support_dir)
ENV['SERVER'] ||= 'LIVE'

# ======== Load gems and config ======
puts 'Loading gems and config...'
require 'env_gems'
require 'env_config'
require 'data_configuration'

# ======== Load environment specific test data ======
# initialise test data in order to fail fast, if config is incorrect or data is missing
initialise_test_data

# ======= load common helpers =======
require_rel '/page_models/sections/'
require_rel '/page_models/pages/'

require_relative 'users.rb'

#===========================================
browser_name = (ENV['BROWSER_NAME'] || 'firefox').downcase

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = (ENV['DRIVER'] || 'selenium').to_sym
  config.javascript_driver = (ENV['DRIVER'] || 'selenium').to_sym
end


# register local browser driver
Capybara.register_driver :selenium do |app|
  Selenium::WebDriver::Chrome.driver_path = chromedriver_path if browser_name == 'chrome'
  http_client = Selenium::WebDriver::Remote::Http::Default.new
  http_client.timeout = 120
  Capybara::Selenium::Driver.new(app, browser: browser_name.to_sym, http_client: http_client)
end


Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app,
                                    js_errors: false,
                                    timeout: 180,
                                    debug: false
  )
end


# ======= taking screenshots =======
Capybara::Screenshot.webkit_options = { width: 1768, height: 768 }
Capybara.save_path = 'screenshots'

Capybara::Screenshot.register_driver :browser_stack do |driver, path|
  driver.browser.save_screenshot(path)
end

Capybara::Screenshot.register_driver :poltergeist do |driver, path|
  driver.render(path, full: true)
end
