#  Estudo do appium_ruby

O que é o APPIUM ?
Appium é uma ferramenta Open Souce e multi-plataforma para automação de aplicações nativas, híbridas e sites mobile para os principais sistemas operacionais do mercado: Android, iOS (e agora para FirefoxOS).

É melhor instalar o Appium através da linha de comando, em vez de baixar o appium, uma vez que o aplicativo GUI do Appium é mais frágil.
Atenção "Verifique se você não instalou Node ou Appium com sudo, caso contrário, você terá problemas"

Pré-requisitos
 Xcode
É um ambiente de desenvolvimento integrado e software livre da Apple Inc. 
Também precisamos autorizar o uso do iOS Simulator:
sudo authorize_ios

  Android studio 
É a IDE oficial para criação de aplicativos em todos os tipos de dispositivos android
Para baixar o android segue o link https://developer.android.com/studio/index.html?hl=pt-br

  Java
Para baixar segue o link http://www.oracle.com/technetwork/pt/java/javase/downloads/jdk8-downloads-2133151.html
Após ter instalado é necessário setar as variáveis de ambiente JAVA_HOME e ANDROID_HOME no seu arquivo bash_profile.
Ex: Abra o terminal e digite:
open ~/.bash_profile   # abre o arquivo bash_profile e cole os arquivos
export ANDROID_HOME=/Users/[SEU USUARIO]/Library/Android/sdk 
export PATH=$PATH:$ANDROID_HOME/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/lib:$ANDROID_HOME/tools/lib:$ANDROID_HOME/bin

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_111.jdk/Contents/Home 
export PATH=$PATH:$JAVA_HOME
export PATH=$PATH:$JAVA_HOME/bin

  Homebrew
O Homebrew instala as coisas que você precisa que a Apple não forneceu para você.
Para instalar o homebrew cole no seu terminal:
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  Node JS
O Appium é um servidor HTTP escrito em node.js que cria e manipula várias sessões do WebDriver para diferentes plataformas, como iOS e Android
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
Uma vez que o node.js e npm e o appium-doctor estão instalados, você pode usar o comando abaixo para verificar se todas as dependências do appium são atendidas,execute o comando abaixo:
appium-doctor             # verificar todas as dependencia necessarias para usar o appium
appium-doctor --android   # verificar as dependencias somente para android
appium-doctor --ios       # verificar as dependencias somente para ios

  Instalar o appium
Execute o comando abaixo para instalar o appium:
npm install -g appium
Quando isso for feito, inicie o servidor do Appium pelo seguinte comando:
appium                    # inicia o servidor do appium
Para atualizar o appium, você precisa executar npm install -g appium novamente.

  Appium Client
São as linguagens de programação suportadas pelo Appium. 
Ruby                    	https://github.com/appium/ruby_lib
Python                  	https://github.com/appium/python-client
Java                    	https://github.com/appium/java-client
JavaScript (Node.js)    	https://github.com/admc/wd
Objective C	              https://github.com/appium/selenium-objective-c
PHP                     	https://github.com/appium/php-client
C# (.NET)               	https://github.com/appium/appium-dotnet-driver
RobotFramework          	https://github.com/jollychang/robotframework-appiumlibrary
Execute o comando abaixo para instalar o appium client:
npm install wd            # cliente do appium

  Desired Capabilities
São um conjunto de chave/valor que são enviados ao Appium Server para informar qual tipo de sessão desejamos iniciar. 
É através do Desired Capabilities que informamos em qual dispositivo queremos executar, e quais as configurações iniciais.
Exemplos:

Capabilities para Android
[caps]
platformName = "Android"
deviceName = 'Nexus_5_API_23_mars'
app = '/Users/[SEU USUARIO]/dev/android/app/build/outputs/apk/app-mobileEmpresas-debug.apk'

Capabilities para iOS
platformName = "iOS"
platformVersion = "10.3"
deviceName = "iPhone 6 Plus"
app = "/Users/[SEU USUARIO]/dev/appium/build/mock/simulator/Empresas.app"

  Sessão
Como o Appium é um servidor toda a comunicação com o dispositivo é realizada através de uma sessão. O cliente inicializa uma sessão com o servidor via POST / session com um objeto JSON chamado Desired Capabilities. Quando a sessão é criada um ID é atribuido a ela para realizar o envio dos comandos para o dispositivo apropriado.


 


 # PARTE 2



- Na pasta do projeto digite 
  Arc help - listar os comandos
  Arc setup android - cria um txt. para android
  Arc setup ios - cria um txt. para ios	
  Arc - start console

2 opcão de instalação
http://hy1984427.github.io/appium/environment_setup/use_appium-doctor_to_verify_settings.html
- executa modo console 
android - arc toml android_appium.txt
ios - arc toml ios_appium.txt

- rodar as features do appium
android = cucumber -p android "nomedafeature"
ios = cucumber -p ios "nomedafeature"

buildar o ios
ruby config/ios/build_app.rb policarpo simulator


Open server appium in backgrou