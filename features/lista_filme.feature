# language: pt

Funcionalidade: Lista de filmes

Eu como usuário
desejo realizar uma busca de filmes por titulo
para poder adicionar na minha lista de favoritos

Cenário: Realizar uma busca por titulo do filme
Dado que estou na lista de filmes
Quando realizar uma busca por titulo
Então vejo o resultado da busca

Cenário: Realizar uma pesquisa por filme preferido
Dado que estou na lista de filmes
Quando realizar uma busca por titulo
Então vejo o resultado da busca

Cenário: Adicionar filme na lista de favoritos
Dado que estou na lista de filmes
E realizar uma busca por titulo
Quando favoritar o filme desejado
Então vejo o filme favoritado na aba favoritos

Cenário: Realizar um testes para exibir status de pendentes
Dado que estou na lista de filmes
Quando realizar uma busca pendentes
Então vejo o resultado da busca pendentes