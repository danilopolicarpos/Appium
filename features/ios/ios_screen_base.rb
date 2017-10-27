def wait_for_element(atributos)
    begin
        wait = Selenium::WebDriver::Wait.new :timeout => 5
        wait.until { find_element(atributos).displayed? }
    rescue
      raise 'Não encontrou resultado da busca'
    end
end

# wait_for_click(:id 'xpto')
def wait_for_click(atributos)
    begin
        wait = Selenium::WebDriver::Wait.new :timeout => 5
        wait { find_element(atributos).click }
    rescue
        raise 'Não consegui efetuar a ação'
    end 
end