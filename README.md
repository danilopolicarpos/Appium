#  Estudo do appium_ruby

O que é o APPIUM ?
Appium é uma ferramenta Open Souce e multi-plataforma para automação de aplicações nativas, híbridas e sites mobile para os principais sistemas operacionais do mercado: Android, iOS (e agora para FirefoxOS).

É melhor instalar o Appium através da linha de comando, em vez de baixar o appium, uma vez que o aplicativo GUI do Appium é mais frágil.
Atenção "Verifique se você não instalou Node ou Appium com sudo, caso contrário, você terá problemas"

Homebrew
O Homebrew instala as coisas que você precisa que a Apple não forneceu para você.
Para instalar o homebrew cole no seu terminal:
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

Node JS
O Appium é um servidor HTTP escrito no node.js que cria e manipula várias sessões do WebDriver para diferentes plataformas, como iOS e Android
A automação de aplicativos móveis híbridos e nativos para Android e iOS é uma função chave administrada pelo Appium, um servidor node.js.  A interação entre o servidor node.js e as bibliotecas de client do Selenium é o que, em última análise, funciona em conjunto com a aplicação móvel.
Para instalar basta colar no terminal:
brew install npm    #instalar o appium via (source) npn ((Node JS Package Manager).)
npm --version       #versão do npm
brew install node   #instalar o node
node --version      #versão do node

Appium-doctor
Verificar se todas as dependências do Appium são atendidas e se todas as dependencia estão configuradas 
corretamente.
Para instalar o appium-doctor basta colar no seu terminal:
npm install -g appium-doctor  # instalar o appium-doctor
Uma vez que o node.js e npm e o appium-doctor estão instalados, você pode usar o comando abaixo para verificar se todas as dependências do appium são atendidas, execute o comando abaixo:
appium-doctor             # verificar todas as dependencia necessarias
appium-doctor --android   # verificar as dependencias somente para android
appium-doctor --ios       # verificar as dependencias somente para ios





 

- open ~/.bash_profile
### Appium ####
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_111.jdk/Contents/Home 
export PATH=$PATH:$JAVA_HOME
export PATH=$PATH:$JAVA_HOME/bin 

- Abra uma nova janela no terminal digite
  appium - start o server

- abra o emulador

- Na pasta do projeto digite 
  Arc help - listar os comandos
  Arc setup android - cria um txt. para android
  Arc setup ios - cria um txt. para ios	
  Arc - start console

2 opcão de instalação
http://hy1984427.github.io/appium/environment_setup/use_appium-doctor_to_verify_settings.html



npm install -g appium   # get appium
npm install wd          # get appium client
appium                  # start appium to see whether it works

- executa modo console 
android - arc toml android_appium.txt
ios - arc toml ios_appium.txt

- rodar as features do appium
android = cucumber -p android "nomedafeature"
ios = cucumber -p ios "nomedafeature"

buildar o ios
ruby config/ios/build_app.rb policarpo simulator