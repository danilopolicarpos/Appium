require 'appium_lib'
require 'selenium-webdriver'

def wait_for_element(atributos)
    begin
      manage.timeouts.implicit_wait = 8
      find_element(atributos) == true
    rescue 
      raise "Não encontrou resultado da busca "
    end
end

def wait_for_click(atributos)
    begin
      manage.timeouts.implicit_wait = 8
      find_element(atributos).click 
    rescue 
        raise "Não consegui efetuar a ação"
    end
end

def element_exist(attribute)
  begin
    manage.timeouts.implicit_wait = 8
    find_element(attribute) == true
  rescue 
      return false
  end
end


def reinstall_apps
    @caps = Appium.load_appium_txt file: File.join(Dir.pwd, 'ios_appium.txt')
    @caps[:caps].delete :noReset 
    @caps[:caps].delete :fullReset
    Appium::Driver.new(@caps, true)
    Appium.promote_appium_methods Object
    $driver.start_driver
end

def scroll_to_text(direction, text_to_search)
    count = 0
    status = false
    if direction.eql? 'down'
      while count <= 15 && status == false
        element = find_element(name: text_to_search)
        if element.displayed? == false
          Appium::TouchAction.new.swipe(start_y: 400, end_y: 300).perform
        else
          status = true
          if (element.location.y > (window_size[:height] * 0.80))
            Appium::TouchAction.new.swipe(start_y: 400, end_y: 300).perform
          end
        end
        count = count + 1
    end
      raise 'Não encontrou resultado com estes parâmetros' if status == false
      if status == true
        return element
      end
    elsif direction.eql? 'up'
      while count <= 15 && status == false
        element = find_element(name: text_to_search)
        if element.displayed? == false
          Appium::TouchAction.new.swipe(start_y: 300, end_y: 400).perform
        else
          status = true
          if (element.location.y > (window_size[:height] * 0.10))
            Appium::TouchAction.new.swipe(start_y: 300, end_y: 400).perform
          end
        end
        count = count + 1
      end
      raise 'Não encontrou resultado com estes parâmetros' if status == false
      if status == true
        return element
      end
    end
  end

def screenshot_elemento(elemento, nome_arquivo, caminho_screenshot)
  begin
    sleep 1 #aguardar o swipe ou tap perform
    Appium::TouchAction.new.swipe(start_y: 400, end_y: 300) if (elemento.location.y > window_size[:height] * 0.80)
    element_screenshot(elemento, File.path(caminho_screenshot + remover_caracteres(nome_arquivo) + ".png"))
  rescue
    print "- Não gerou a imagem - "
    return false
  end
end

def esvaziar_pasta(caminho_pasta)
  Dir.foreach(caminho_pasta) do |arquivos|
    arquivo = File.join(caminho_pasta, arquivos)
    if (arquivos != '.' && arquivos != '..')
      File.delete(arquivo)
    end
  end
end

def remover_caracteres(texto)
  texto = texto.gsub('{1,2}',"")
  texto = texto.gsub('{1,2,3}',"")
  texto = texto.gsub('{1, 2}', "")
  return texto
end

def comparar_imagens(texto_elemento, caminho_screenshot, caminho_matriz)
  nome_arquivo = remover_caracteres(texto_elemento) + ".png"
  imagem1 = File.read caminho_screenshot + nome_arquivo
  imagem2 = File.read caminho_matriz + nome_arquivo
  get_images_result = @driver.get_images_similarity first_image: imagem1, second_image: imagem2, visualize: false
  print get_images_result #Debug
  if get_images_result['score'] >= 0.99
    return true
  else
    return false
  end
end

def esvaziar_pasta(caminho_pasta)
  Dir.foreach(caminho_pasta) do |arquivos|
    arquivo = File.join(caminho_pasta, arquivos)
    if (arquivos != '.' && arquivos != '..')
      File.delete(arquivo)
    end
  end
end

def scroll_manual(quantidade)
  (0...quantidade).each do
    Appium::TouchAction.new.swipe(start_y: 300, end_y: 400).perform
  end
end