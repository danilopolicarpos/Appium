# language: pt
Funcionalidade: Login

    Cenário: Posso logar no aplicativo utilizando vários tipos de conta de pessoa física
        Dado que vejo a tela de boas vindas
        E clico no link ja tenho uma conta
        E vejo a Home de login
        E digitei a credencial “varejo”
        E toquei no botão OK
        E digitei a senha no teclado virtual
        Quando toquei no botão acessar
        Então vejo a nova home