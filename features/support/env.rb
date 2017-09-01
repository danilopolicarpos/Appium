require 'rspec/expectations'
require 'appium_lib'
require 'cucumber/ast'
require 'spec_helper'
require 'rspec'
require 'rails_helper'


# Create a custom World class so we don’t pollute `Object` with Appium methods
include RSpec::Matchers
RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

class AppiumWorld
end

if ENV['PLATFORM'] == 'ios'
  caps = Appium.load_appium_txt file: File.expand_path('/Users/Danilo.Policarpo/dev/appium/ios_appium.txt', __FILE__), verbose: true
elsif ENV['PLATFORM'] == 'android'
  caps = Appium.load_appium_txt file: File.expand_path('/Users/Danilo.Policarpo/dev/appium/android_appium.txt', __FILE__), verbose: true
end

Appium::Driver.new(caps)
Appium.promote_appium_methods AppiumWorld

World do
  AppiumWorld.new
end



Before { $driver.start_driver }
After { $driver.driver_quit }