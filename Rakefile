require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

desc 'Start server Appium'
task :appium_server do
  puts 'iniciando server do appium'
  system 'nohup appium &'
end

desc 'Close server Appium'
task :close_appium_server do
  puts 'fechando conexão do server do appium'
  system "ps -ef | grep -v grep | grep appium | awk '{print $2}' | xargs kill -9"
end

desc 'Run test in Android'
task :android do
  sh "cucumber -p android"
end

desc 'Run test in iOS'
task :ios do
  sh "cucumber -p ios"
end




