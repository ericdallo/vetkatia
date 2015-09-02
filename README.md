# Projeto Vetkatia <img src="http://vetkatia.herokuapp.com/assets/logo-c959a0ec1643718e1fd4b6620dc27e814c36f931d955e1e69fba20f040469f25.png" width="100"/>

__Projeto para clinica veterinária onde é possivel salvar dados de clientes e animais e controle de medicamentos.__

## Configuração

- Pacotes basicos que devem ser instalados
  ```bash
  sudo apt-get install curl build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion
  ```
- Ruby
  ``curl -L https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm``
``rvm list known`` Para ver a versão mais nova
``rvm install 2.2.0`` ou versão mais nova

- Rails
  ``gem install rails``
  
- Atualizar gems
  ``bundle install``
  
## Iniciar servidor
  ``bundle exec rails server``
