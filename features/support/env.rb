# frozen_string_literal: true

require 'rspec/expectations'
require 'appium_lib'
require 'pry'

case ENV['PLATFORM'] 
 when 'ios'
  caps = Appium.load_appium_txt file: File.join('./ios_appium.txt')
 when 'android'
  caps = Appium.load_appium_txt file: File.join('./android_appium.txt')
end


Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object
