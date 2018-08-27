require 'rspec/expectations'
require 'appium_lib'
require 'pry'
require 'parallel'

if ENV['PLATFORM'] == 'ios'
  caps = Appium.load_appium_txt file: File.expand_path('./../../../ios_appium.txt', __FILE__), verbose: true
elsif ENV['PLATFORM'] == 'android'
    binding.pry
    files = Dir['./caps_android/*']
    resultado = Hash[files.collect { |item| [item.gsub(" ", "")] } ]

    resultado = Parallel.map(resul) do |x|
     caps = Appium.load_settings file: File.join(x), verbose: true
     puts caps
    end
  #caps = Appium.load_settings file: File.join('./caps_android', 'oreo.txt'), verbose: true
end

Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object