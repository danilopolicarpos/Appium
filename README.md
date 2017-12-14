#  Estudo do appium_ruby

## O que é o APPIUM ?

Appium é uma ferramenta Open Source e multi-plataforma para automação de aplicações nativas, híbridas e sites mobile para os principais sistemas operacionais do mercado: Android, iOS (e agora para FirefoxOS).

É melhor instalar o Appium através da linha de comando, em vez de baixar o appium, uma vez que o aplicativo GUI do Appium é mais frágil.

Atenção "Verifique se você não instalou Node ou Appium com sudo, caso contrário, você terá problemas"

## Pré-requisitos

### > Xcode

É um ambiente de desenvolvimento integrado e software livre da Apple Inc.
Também precisamos autorizar o uso do iOS Simulator:
```
sudo authorize_ios
```
### > Android studio

É a IDE oficial para criação de aplicativos em todos os tipos de dispositivos android
Para baixar o android segue o link: https://developer.android.com/studio/index.html?hl=pt-br

### > Java

Para baixar segue o link:
http://www.oracle.com/technetwork/pt/java/javase/downloads/jdk8-downloads-2133151.html

Após ter instalado é necessário setar as variáveis de ambiente JAVA_HOME e ANDROID_HOME no seu arquivo bash_profile.

Ex: Abra o terminal e digite:
```
open ~/.bash_profile   # abre o arquivo bash_profile e cole os arquivos
```
export ANDROID_HOME=/Users/[SEU USUARIO]/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/lib:$ANDROID_HOME/tools/lib:$ANDROID_HOME/bin

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_111.jdk/Contents/Home
export PATH=$PATH:$JAVA_HOME
export PATH=$PATH:$JAVA_HOME/bin

### > Homebrew

O Homebrew instala os pacotes que não vem por padrão no sistema da Apple.
Para instalar o homebrew cole no seu terminal:
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### > Node JS

O Appium é um servidor HTTP escrito em node.js que cria e manipula várias sessões do WebDriver para diferentes plataformas, como iOS e Android.
A automação de aplicativos móveis híbridos e nativos para Android e iOS é uma função chave administrada pelo Appium, um servidor node.js.  A interação entre o servidor node.js e as bibliotecas de client do Selenium é o que, em última análise, funciona em conjunto com a aplicação móvel.
Para instalar basta colar no terminal:
```
brew install npm    #instalar o appium via(source) npn(Node JS Package Manager)
npm --version       #versão atual do npm
brew install node   #instalar o node
node --version      #versão atual do node
```

### > Appium-doctor
Verificar se todas as dependências do Appium são atendidas e se todas as dependências estão configuradas corretamente.
Para instalar o appium-doctor basta colar no seu terminal:
```
npm install -g appium-doctor  # instalar o appium-doctor
```

Uma vez que o node.js, npm e o appium-doctor estão instalados, você pode usar o comando abaixo para verificar se todas as dependências do appium são atendidas, execute o comando abaixo:
```
appium-doctor             # verificar todas as dependencia necessarias para usar o appium
appium-doctor --android   # verificar as dependencias somente para android
appium-doctor --ios       # verificar as dependencias somente para ios
```

## Instalar o appium

Execute o comando abaixo para instalar o appium:
```
npm install -g appium
```

Após o término, inicie o servidor do Appium pelo seguinte comando:
```
appium                    # inicia o servidor do appium
```

Para atualizar o appium, você precisa executar npm install -g appium novamente.

## Appium Client

São as linguagens de programação suportadas pelo Appium.

- Ruby                    	https://github.com/appium/ruby_lib
- Python                  	https://github.com/appium/python-client
- Java                    	https://github.com/appium/java-client
- JavaScript (Node.js)    	https://github.com/admc/wd
- Objective C	              https://github.com/appium/selenium-objective-c
- PHP                     	https://github.com/appium/php-client
- C# (.NET)               	https://github.com/appium/appium-dotnet-driver
- RobotFramework          	https://github.com/jollychang/robotframework-appiumlibrary


Execute o comando abaixo para instalar o appium client:
```
npm install wd            # cliente do appium
```

## Desired Capabilities

São um conjunto de chave/valor que são enviados ao Appium Server para informar qual tipo de sessão desejamos iniciar.
É através do Desired Capabilities que informamos em qual dispositivo queremos executar, e quais as configurações iniciais.
Exemplos:

Capabilities para Android
```
[caps]
platformName = "Android"
deviceName = 'Nexus_5_API_23_mars'
app = '/Users/[SEU USUARIO]/dev/android/app/build/outputs/apk/nome.apk'

```

Capabilities para iOS
```
[caps]
platformName = "iOS"
platformVersion = "10.3"
deviceName = "iPhone 6 Plus"

app = "/Users/[SEU USUARIO]/dev/appium/build/mock/simulator/nome.app"

```

## Sessão

Como o Appium é um servidor toda a comunicação com o dispositivo é realizada através de uma sessão. O cliente inicializa uma sessão com o servidor via POST / session com um objeto JSON chamado Desired Capabilities. Quando a sessão é criada um ID é atribuido a ela para realizar o envio dos comandos para o dispositivo apropriado.


# Criando um projeto Appium_Android 

Abra o terminal e execute os comandos abaixo :
```
cucumber --init      # criando estrutura do projeto

create   features
create   features/step_definitions
create   features/support
create   features/support/env.rb
```
```
Arc setup android  # cria um txt. para android (Capabilities para Android)
```
Abra o Capabilities para Android e preencha o arquivo conforme exemplo:
```
 [caps]
platformName = "Android"                        # Plataforma
deviceName = 'Nexus_5_API_23_mars'              # nome do dispositivo
app = '/Users/estudo_appium.apk'                # caminho do apk
```

- Inspecionando elemento

  Para inspecionar os elementos na plataforma android podemos usar essas opções:
  
  - Console (Arc)

      Inicie o servidor do Appium pelo seguinte comando:
      ```
      appium        # inicia o servidor do appium
      ```
      Abre uma nova aba e digite o comando
      ```
      Arc           # inicia o modo console
      page          # inspeciona os elementos da tela
      source        # inspeciona os elementos da tela em HTML
      exit          # sair do console
      ```


  -  Automatorviewer

      Para inspecionar os elemento na tela usando o automatorviewer acesse o link https://nishantverma.gitbooks.io/appium-for-android/exploring_uiautomatorviewer/


- Executando seus testes

  Para rodar os testes execute os comandos no terminal:
  ```
  cucumber                          # rodar todos seus testes
  cucumber feature/<nomefeature>    # executa todos os cenários de uma feature especifica.
  ```
  Atenção "Antes de rodar seus testes inicia o servidor do appium "

- Gerando relatório de teste

  Para gerar o relatório no final dos teste, basta colocar o comando:
  ```
  <--format html --out reports.html>
  ```
  exemplo: cucumber feature/<nomefeature> --format html --out reports.html


# Criando um projeto Appium_iOS

Abra o terminal e execute os comandos abaixo :
```
cucumber --init    # criando estrutura do projeto

create   features
create   features/step_definitions
create   features/support
create   features/support/env.rb
```
```
Arc setup ios    # cria um txt. para ios (Capabilities para iOS)
```
Abra o Capabilities para iOS e preencha o arquivo conforme exemplo:
 ```
 [caps]
platformName = "ios"                            # Plataforma
platformVersion = "10.3"                        # OS
deviceName = "iPhone 5"                         # nome do dispositivo
app = '/Users/estudo_appium.apk'                # caminho do apk

```
- Inspecionando elemento

  Para inspecionar os elementos na plataforma android podemos usar essas opções:
  
  - Console (Arc)

      Inicie o servidor do Appium pelo seguinte comando:
      ```
      appium        # inicia o servidor do appium
      ```
      Abre uma nova aba e digite o comando
      ```
      Arc           # inicia o modo console
      page          # inspeciona os elementos da tela
      source        # inspeciona os elementos da tela em HTML
      exit          # sair do console
      ```


  -  Macaca Js

      Para inspecionar os elemento na tela usando Macaca acesse o link 
      https://macacajs.github.io/ ou https://medium.com/@deyvirsonmendona/inspecionando-elementos-no-app-ios-com-macacajs-cad962719ce2


- Executando seus testes

  Para rodar os testes execute os comandos no terminal:
  ```
  cucumber                          # rodar todos seus testes
  cucumber feature/<nomefeature>    # executa todos os cenários de uma feature especifica.
  ```
  Atenção "Antes de rodar seus testes inicia o servidor do appium "

- Gerando relatório de teste

  Para gerar o relatório no final dos teste, basta colocar o comando:
  ```
  <--format html --out reports.html>
  ```
  exemplo: cucumber feature/<nomefeature> --format html --out reports.html

## Dúvidas

### > Documentação do Appium 
      acesse o link http://appium.io/slate/en/master/?ruby#

### >  Github do Appium
      acesse o link https://github.com/appium/appium

### > Configuração do JAVA_HOME 
      acesse o link https://www.mkyong.com/java/how-to-set-java_home-environment-variable-on-mac-os-x/

### >  Opções de instalação
      acesse o link http://hy1984427.github.io/appium/environment_setup/use_appium-doctor_to_verify_settings.html

### >  Verificar o deviceName instalado na máquina 

      Abra o terminal e execute os comandos abaixo :

      emulator -list-avds       # verifica os emuladores existentes

### > Xcode Command Line Tools are NOT installed!

      Abra o terminal e execute os comandos abaixo :

      xcode-select --install    # instala Xcode Command Line Tools

### > Could not get Xcode version. /Library/Developer/Info.plist

      Abra o terminal e execute os comandos abaixo :

      sudo xcode-select --reset
      sudo xcode-select --switch /Applications/Xcode.app


### > Removendo DEPRECATION

      [DEPRECATION] Appium::Driver.new(opts) will not generate global driver by default.If you would like to generate the global driver dy default, please initialise driver with Appium::Driver.new(opts, true)
      
      Abra o terminal e execute os comandos abaixo :
      
      gem list appium_console              #verifica as versões instaladas
      gem list appium_lib                

      Excluir todas as versões:
      gem uninstall appium_console          #Remove versão instalada
      gem uninstall appium_lib
       
      Updade na versão:
      gem update appium_console             #Atualiza a versão instalada
      gem update appium_lib
      
      #Atenção: Devo somente ter uma versão da gem instalada, sendo a mais recente 


## > Deixando a execução do script limpa no terminal
     
      WARN: Unresolved specs during Gem::Specification.reset:
      childprocess (~> 0.5)
      awesome_print (~> 1.7)
      json (>= 1.8)
      nokogiri (>= 1.6.6, ~> 1.6)

      Abra o terminal e execute os comandos abaixo :
      
      Visualiza versão gem:
      gem list [NomeGem]                       #verifica as versões instaladas
     
      Excluir todas as versões:
      gem uninstall [NomeGem]                  #Remove versão instalada
       
      Updade na versão:
      gem update [NomeGem]                     #Atualiza a versão instalada
      
      
      #Atenção: Devo somente ter uma versão da gem instalada, sendo a mais recente.              
      Para as gem nokogiri deixar instalada a versão maior, exemplo:"nokogiri (1.6.8.1)".              
                
      Para a versão json  deixar instalada a versão default, exemplo: "json (default: 1.8.3)".