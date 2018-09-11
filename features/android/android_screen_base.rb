# frozen_string_literal: true

# wait_for_element(id: @contato,:timeout => 5)
def wait_for_element(atributos)
  begin
  wait = Selenium::WebDriver::Wait.new
  wait.until { find_element(atributos).displayed? }
  rescue Selenium::WebDriver::Error::TimeOutError => e
    raise "Não encontrou resultado da busca \n #{e.message}"
end
end

# wait_for_click(:id 'xpto')
def wait_for_click(atributos)
  begin
    wait = Selenium::WebDriver::Wait.new
    wait { find_element(atributos).click }
  rescue Selenium::WebDriver::Error::TimeOutError => e
    raise "Não consegui efetuar a ação \n #{e.message}"
  end
end

def reinstall_apps
  @driver.reset
end

# element_exist(id: @contato,:timeout => 5)
def element_exist(attribute)
  begin
    wait = Selenium::WebDriver::Wait.new
    wait.until { find_element(attribute).displayed? }
  rescue 
      return false
  end
end
