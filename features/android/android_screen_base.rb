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

def screenshot_elemento(elemento, nome_arquivo, caminho_screenshot)
  begin
    swipe(start_x: window_size[:width] - 3, start_y: window_size[:height] * 0.6, end_x: window_size[:width] - 3, end_y: window_size[:height] * 0.4) if (elemento.location.y > window_size[:height] * 0.80)
    element_screenshot(elemento, File.path(caminho_screenshot + nome_arquivo + ".png"))
  rescue
    print "- Não gerou a imagem - "
    return false
  end
end

def comparar_imagens(texto_elemento, caminho_screenshot, caminho_matriz)
  nome_arquivo = texto_elemento + ".png"
  imagem1 = File.read caminho_screenshot + nome_arquivo 
  imagem2 = File.read caminho_matriz + nome_arquivo
  get_images_result = @driver.get_images_similarity first_image: imagem1, second_image: imagem2, visualize: false
  print get_images_result 
  if get_images_result['score'] >= 0.99
    return true
  else
    return false
  end
end

def resolucao_tela_altura
  window_size[:height] 
end

def resolucao_tela_largura
 window_size[:width]
end

def esvaziar_pasta(caminho_pasta)
  Dir.foreach(caminho_pasta) do |arquivos|
    arquivo = File.join(caminho_pasta, arquivos)
    if (arquivos != '.' && arquivos != '..')
      File.delete(arquivo)
    end
  end
end