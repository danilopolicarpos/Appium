# frozen_string_literal: true

Dado('que estou na lista de filmes') do
  @lista = Lista_filme_Screen.new
  @lista.home
end

Quando('realizar uma busca por titulo') do
  @lista.buscar_filmes
end

Então('vejo o resultado da busca') do
  @lista.titulo_filme
end

Quando('favoritar o filme desejado') do
  @lista.tocar_favoritos
end

Então('vejo o filme favoritado na aba favoritos') do
  @lista.vejo_favorito
end
