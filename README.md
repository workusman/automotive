# AutoMotive
RAILS API that allows an agent to capture customer information, vehicle information, and secure a time slot.
## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.
### Prerequisites
What things you need to install the software and how to install them
```
postgres sql-12
ruby 2.6.5
```
install bundler gem
```
gem install bundler 2.1.2
```
### Installing
clone the repository and install required gems
```
git clone https://github.com/workusman/automotive.git
cd automotive
bundle install
```
### Setup
Update the `username` and `password` in `config/database.yml` with your `postgres credentials`.
```
default: &default
  adapter: postgresql
  encoding: unicode
  username: "postgres"
  password: "12345678"
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
 ```
Create database and run migrations
```
bundle exec rake db:create
bundle exec rake db:migrate
```
Start the Rails server
```
bundle exec rails server
```
And now you can visit the site with the URL http://localhost:3000
## Running the tests
To run test suits use the following command
```
rspec
```
