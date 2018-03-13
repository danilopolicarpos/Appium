## Exemplos de Métodos usados no Appium

 - driver.rotate :landscape

 - driver.rotate :portrait

 - find_element(id:'title').text = retorna o texto do elemento

 - find_element(id:'title').name = retorna o texto do elemento

 - find_element(id:'title') = busca o elemento

 - find_element(id:'showInvisible').click = encontra o elemento e toca nele

 - find_element(id:'showInvisible').clear = limpa o campo 

 - find_element(id:'showInvisible').tag_name = verifica a class do elemento

 - find_element(id:'showInvisible').displayed? = retorna true ou falso

 - find_element(id:'showInvisible').attribute('checked') = retorna true ou falso para o um checkbox

 - driver.hide_keyboard = somente android por enquanto

 - find_element(name: 'Go').location = valores de x e y

 - find_element(name: 'Go').rect = valores de x,y, height e width

 - start_driver = reinicia o driver

 - find_elements(id:'wandimito')[1] 

 - scroll_to("Batman & Robin")

 - scroll_to("direction:'up'")

 - driver.press_keycode(4)

 - driver.navigate

 - driver.back

 - appium.device

 - find_element(:accessibility_id, 'SomeAccessibilityID').attribute("content-desc")

 - find_element(:accessibility_id, "SomeAccessibilityID").enabled?

 - find_element(:accessibility_id, "SomeAccessibilityID").selected?

 - find_element(:accessibility_id, "SomeAccessibilityID").send_keys("Hello World!")

 - Appium::TouchAction.new.tap( x: 539, y:1700, count: 1).release.perform = tocar no elemento por posição com duração default 1000

 - Appium::TouchAction.new.long_press( x: 768, y:456, count: 1, duration: 2000).release.perform = tocar no elemento por posição passando duração 

- teste = find_element(id: 'search')
Appium::TouchAction.new.long_press(element: teste, duration: 2000).release.perform = tocar por elemento

- def scroll_pra_baixo vezes = 1
swipe(start_y:600, offset_y:200, duration:1000)
end
2.times do
scroll_pra_baixo
end
= Método de scroll para ios

- value = ""; 8.times{value  << (65 + rand(25)).chr}
value << "@gmail.com"
wait{find_element(id: "showInvisible").send_keys(value)}
find_element(id: "showInvisible").click
= Método para a criação de emails aleatórios

http://www.seleniumhq.org/docs/03_webdriver.jsp
