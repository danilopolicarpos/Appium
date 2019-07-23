# frozen_string_literal: true

Before do
  driver.start_driver
end

After do 
  driver.driver_quit
end

at_exit do
  require 'report_builder'
  ReportBuilder.configure do |config|
    config.input_path = 'reports/cucumber_json'
    config.report_path = 'reports/report'
    config.report_title = 'Lista de Filmes'
    config.additional_info = {Platform: 'Android', Environment: 'Piloto'}
  end
  ReportBuilder.build_report
end

Before('@reinstall') do
  reinstall_apps
end

After('@reinstall') do
  @caps = Appium.load_appium_txt file: File.join(Dir.pwd, 'ios_caps.txt')
  Appium::Driver.new(@caps, true)
  Appium.promote_appium_methods Object
end

After do |scenario|
	Dir.mkdir('reports') unless Dir.exist?('reports')

	evidencia = ("error" if scenario.failed?)
	name = scenario.name.gsub(' ', '_').downcase

	screenshot("reports/#{evidencia}-#{name}.png")
  embed("#{evidencia}-#{name}.png", "image/png")
end
