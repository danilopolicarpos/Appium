# frozen_string_literal: true

# wait_for_element(id: @contato)
def wait_for_element(atributos)
  begin
  manage.timeouts.implicit_wait = 8
  find_element(atributos) == true
  rescue 
    raise "Não encontrou resultado da busca"
  end
end

# wait_for_click(:id 'xpto')
def wait_for_click(atributos)
  begin
    manage.timeouts.implicit_wait = 8
    find_element(atributos).click 
  rescue 
    raise "Não consegui efetuar a ação"
  end
end

def reinstall_apps
  @driver.reset
end

# element_exist(id: @contato)
def element_exist(attribute)
  begin
    manage.timeouts.implicit_wait = 8
    find_element(attribute) == true
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

def scroll(direction:, name: nil, element: nil, to_visible: nil, predicate_string: nil)
  return 'Set "up", "down", "left" or "right" for :direction' unless %w(up down left right).include?(direction)

  args =  { direction: direction }
  args[:element] = element.ref if element
  args[:name] = name if name
  args[:toVisible] = to_visible if to_visible
  args[:predicateString] = predicate_string if predicate_string
  binding.pry
  @driver.execute_script 'mobile: scroll', args
end

def click_for_position
  name = "fifa"
  r = find_elements(id: "com.whatsapp:id/conversations_row_contact_name")
 i = 0
 while i < r.length do 
  t = r[i].text
  i += 1
  end
  r.text(name).click
end