
# require_relative '../../lib/appium_lib'


# class TestParallelRunThread
#   def initialize(capability)
#     @capability = capability
#   end

#   def setup
#     @appium = Appium::Driver.new({ caps: @capability}, false)
#     @appium.start_driver
#   end

#   def teardown
#     @appium.quit_driver
#     puts "finish: #{@capability}"
#   end

#   def test_run
#     setup

#     # tap alert
#     @appium.find_element(:name, 'Alerts').click
#     @appium.wait_true do
#       @appium.find_element(:name, 'Show OK-Cancel').click
#       @appium.find_element(:name, 'UIActionSheet <title>').displayed?
#     end
#     @appium.alert action: 'accept'
#     @appium.back

#     sleep 5

#     # TouchAction
#     text_elem = @appium.text(@appium.app_strings['ButtonsExplain'])
#     @appium.tap x: 0, y: 0, element: text_elem
#     @appium.back

#     teardown
#   end
# end

# class TestParallelRunProcess
#   def initialize(capability)
#     @capability = capability
#   end

#   def setup
#     @appium = Appium::Driver.new({ caps: @capability, appium_lib: des_server_caps }, false)
#     Appium.promote_appium_methods TestParallelRunProcess, @appium
#     start_driver
#   end

#   def teardown
#     quit_driver
#     puts "finish: #{@capability}"
#   end

#   def test_run
#     setup

#     # tap alert
#     find_element(:name, 'Alerts').click
#     wait_true do
#       find_element(:name, 'Show OK-Cancel').click
#       find_element(:name, 'UIActionSheet <title>').displayed?
#     end
#     alert action: 'accept'
#     back

#     sleep 5

#     # TouchAction
#     text_elem = text(app_strings['ButtonsExplain'])
#     tap x: 0, y: 0, element: text_elem
#     back

#     teardown
#   end
# end

# # Rakefile

# class Device
#   def self.one
#     {
#       automationName: 'xcuitest',
#       platformName: 'ios',
#       platformVersion: '11.0',
#       deviceName: 'iPhone 6',
#       app: "#{Dir.pwd}/../test_apps/UICatalog.app",
#       wdaLocalPort: 8100,
#       isCommandsQueueEnabled: false
#     }
#   end

#   def self.two
#     {
#       automationName: 'xcuitest',
#       platformName: 'ios',
#       platformVersion: '11.0',
#       deviceName: 'iPhone 6s',
#       app: "#{Dir.pwd}/../test_apps/UICatalog.app",
#       wdaLocalPort: 8200,
#       isCommandsQueueEnabled: false
#     }
#   end
# end

# desc 'Run tests with parallel thread'
# task :run_parallel_t do
#   require 'thread'
#   require_relative 'parallel/test'

#   threads = []
#   [Device.one, Device.two].each do |capability|
#     threads << Thread.new do
#       TestParallelRunThread.new(capability).test_run
#     end
#   end

#   threads.each(&:join)
# end

# desc 'Run tests with parallel processes'
# task :run_parallel_p do
#   require_relative 'parallel/test'

#   [Device.one, Device.two].each do |capability|
#     fork do
#       TestParallelRunProcess.new(capability).test_run
#     end
#   end

#   Process.waitall
# end