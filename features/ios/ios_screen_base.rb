require 'appium_lib'

def wait_for_element(atributos)
    begin
        wait = Selenium::WebDriver::Wait.new :timeout => 5
        wait.until { find_element(atributos).displayed? }
    rescue Selenium::WebDriver::Error::TimeOutError => e
      raise "Não encontrou resultado da busca \n #{e.message}"
    end
end

# wait_for_click(:id 'xpto')
def wait_for_click(atributos)
    begin
        wait = Selenium::WebDriver::Wait.new :timeout => 5
        wait { find_element(atributos).click }
    rescue Selenium::WebDriver::Error::TimeOutError => e
        raise "Não consegui efetuar a ação \n #{e.message}"
    end
end


def scroll(direction:, element: nil)
    return 'Set "up", "down", "left" or "right" for :direction' unless %w(up down left right).include?(direction)
    args =  { :direction => direction }
    @driver.execute_script 'mobile: scroll', args
  end

def reinstall_apps
    @caps = Appium.load_appium_txt file: File.join(Dir.pwd, 'ios_appium.txt')
    @caps[:caps].delete :noReset 
    @caps[:caps].delete :fullReset
    Appium::Driver.new(@caps, true)
    Appium.promote_appium_methods Object
    $driver.start_driver
end
