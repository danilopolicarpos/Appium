require 'rspec/expectations'
require 'appium_lib'
require 'pry'
require 'parallel'

if ENV['PLATFORM'] == 'ios'
  caps = Appium.load_appium_txt file: File.expand_path('./../../../ios_appium.txt', __FILE__), verbose: true
elsif ENV['PLATFORM'] == 'android'
  
    files = Dir['./caps_android/*']

    resultado = Parallel.map(files) do |x|
     Hash[files.collect { |item| [item.gsub(" ", "")] } ]
     @caps = Appium.load_appium_txt file: File.join(x), verbose: true
    end
  #caps = Appium.load_settings file: File.join('./caps_android', 'oreo.txt'), verbose: true
end
binding.pry
Appium::Driver.new({ caps: @caps}, true)
# Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object