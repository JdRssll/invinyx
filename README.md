invinyx
=======

Sistema de administracion de inventario

Instalacion
=======

* sudo apt-get install mysql-client libmysqlclient-dev
* rvm install ruby-2.0.0-p0
* rvm use ruby-2.0.0-p0
* git clone https://github.com/JdRssll/invinyx.git
* cd invinyx
* bundle install
* rake db:migrate
* rails console user.create :email => 'usuario@ejemplo.com', :password => '12345678', :password_confirmation => '12345678'