Before do
  $driver.start_driver
end

After do
  $driver.driver_quit
end

Before ('@reinstall') do 
  reinstall_apps
end