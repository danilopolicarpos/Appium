class AcessarSiteScreen
  attr_accessor :driver
  def initialize(driver)
    @driver = driver
    @layout_name =  'XCUIElementTypeButton'
    @url = 'XCUIElementTypeTextField'
    @enter = 'XCUIElementTypeButton'
    @home_site = 'XCUIElementTypeLink'

  end

  def acessar_homePage
    @driver.find_element(class:"#{@layout_name}").text
  end  

  def acessar_site(site)
    @site = CREDENTIALS[site.gsub(' ', '_').to_sym][:url]    
    @driver.find_element(class: "#{@url}").send_keys @site
    @driver.find_element(class: "#{@enter}").click
  end

  def visualizar_home_site
    sleep(2)
    # wait = Selenium::WebDriver::Wait.new(:timeout => 20)
    # fail "Site não aberto" if wait.until{ @driver.find_element(class: "#{@home_site}").displayed? != true}

    fail "Site não aberto" if (@driver.find_element(class: "#{@home_site}").displayed? != true)

  end
end
