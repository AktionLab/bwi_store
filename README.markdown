BWI Store
---------

Spree Version: 0-70-stable
Database: Postgres 9.1
Session Store: memcached

Setup
-----

First make sure you have postgres installed and that your shell user has a superuser in postgres

createuser [user]

Then copy the sample database config and set the username in the config

cp config/database.yml.pg config/database.yml
*Add [user] in the database.yml*

Now create the databases, migrate the data and seed.

rake db:create:all db:migrate db:seed

Finally, in order to have session work, you'll need to have memcached running. This can be installed with your OS package management, the default settings are fine.

