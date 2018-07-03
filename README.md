# Noteblocks

### Configuration
- Ruby version `2.5.1` (we use [rvm](https://rvm.io/) to manage ruby)
- We use [bundler](http://bundler.io/) to manage dependencies
- install bundler with `gem install bundler`
- now run `bundle install` to install dependencies

### Database creation
- Install [postgreSQL](http://postgresql.com/) by following standard install steps

- follow these instructions to properly add a user,
replace `nb_user` with desired pg username and `pass` with desired password for your user
- $ `sudo -u postgres createuser nb_user`
- $ `sudo -u postgres psql`
- $ postgres=# `ALTER USER nb_user CREATEDB;`
- $ postgres=# `ALTER USER nb_user WITH PASSWORD 'pass';`
- Create `database.yml` from `database.yml.example` file and add your username and password

### Database initialization
- run `bundle exec rails db:create db:schema:load db:seed` to create db and add seed data
- run `bundle exec rails db:drop db:create db:schema:load db:seed` to drop current db and start fresh

### How to run the test suite
We use [Rspec](http://rspec.info/) with [factory_bot](https://github.com/thoughtbot/factory_bot) for testing

- run `bundle exec rspec` to run full test suite
- run `bundle exec rspec <test-file/folder>` to run parts of suite
- add `-fd` flag to run test with formatted output

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
