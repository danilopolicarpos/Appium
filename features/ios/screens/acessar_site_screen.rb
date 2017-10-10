class AcessarSiteScreen
  def initialize
    @layout_name = 'XCUIElementTypeButton'
    @url = 'XCUIElementTypeTextField'
    @enter = 'XCUIElementTypeButton'
    @home_site = 'XCUIElementTypeLink'
  end

  def acessar_homePage
    find_element(class: @layout_name.to_s).text
  end

  def acessar_site(site)
    @site = CREDENTIALS[site.tr(' ', '_').to_sym][:url]
    find_element(class: @url.to_s).send_keys @site
    find_element(class: @enter.to_s).click
  end

  def visualizar_home_site
    sleep(2)
    # wait = Selenium::WebDriver::Wait.new(:timeout => 20)
    # fail "Site não aberto" if wait.until{ @driver.find_element(class: "#{@home_site}").displayed? != true}

    raise 'Site não aberto' if find_element(class: @home_site.to_s).displayed? != true
  end
end
