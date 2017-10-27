# language: pt
Funcionalidade: Ocultar contados da agenda do usuário
    
  Cenário: Ocultar contato da agenda
    Dado que acesso agenda telefonica
    E vejo os contatos da agenda
    Quando toco em "Show Invisible Contacts (Only)"
    Então devo ver os contatos da agenda ocultos