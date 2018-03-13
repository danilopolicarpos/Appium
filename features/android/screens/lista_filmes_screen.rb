# frozen_string_literal: true

class Lista_filme_Screen do
  def initialize
    @layout_name = 'home_omdb'
    @buscar_filme = 'search_title'
    @btn_buscar = 'search'
    @title = 'title'
    @btn_favoritos = 'favorite'
  end

  def home
    wait_for_element(id: @layout_name, timeout: 5)
  end

  def buscar_filmes
    @filmes = "batman forever"
    find_element(id: @buscar_filme).send_keys(@filmes)
    find_element(id: @btn_buscar).click
  end

  def titulo_filme
    wait_for_element(id: @title, timeout: 5)
  end

  def tocar_favoritos
    find_element(id: @btn_favoritos).click
    find_elements(class:'android.widget.TextView').text("Favoritos").click
  end

  def vejo_favorito
    wait_for_element(id: @title, timeout: 5)
  end

end
