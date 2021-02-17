Prerequisites
	The setups steps expect following tools installed on the system.

* Postgres sql-12
* Ruby 2.6.5

1. Check out the repository
		'git clone https://github.com/workusman/automotive.git'
2. Install gems
		'bundle install'
3. Set Credentials in database.yml
		Use postgres username and password in database.yml
4. Create and setup the database
		Run the following commands to create and setup the database.
			'bundle exec rake db:create'
			'bundle exec rake db:migrate'
5. Start the Rails server
		You can start the rails server using the command given below.
			'bundle exec rails server'
6. And now you can visit the site with the URL http://localhost:3000
7. To run test suits use the following command
		'rspec'
