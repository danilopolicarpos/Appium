#  Estudo do appium_ruby


- Install Ruby

- Install brew

- Install nodejs usando brew
   brew install node
   brew install npm
   node --version
   npm --version

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

rvm install ruby        # install ruby and brew
brew install node       # get node.js
npm install -g appium   # get appium
npm install wd          # get appium client
appium                  # start appium to see whether it works