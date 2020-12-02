# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

__________
Steps to setup:

Install Devise:
1. Add devise in Gemfile
Then:
```ruby
bundle install
rails generate devise:install
```
In config/environments/development.rb, put: 
```ruby
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
```
Must see this:
```ruby
# Don't care if the mailer can't send.
  config.action_mailer.delivery_method = :letter_opener
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_caching = false
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
```
Follow instructions of the message in the terminal (flash, alerts, notices)

Remove helpers and assets in `application.rb`:
```ruby
config.generators.helpers = false
config.generators.assets = false
```

2. Create controller Home: rails g controller Home index secret
3. Create DB: rdbc
```ruby
rails db:create
```
4. Set Active Storage to put an avatar on a user: 
```ruby
rails active_storage:install
```
Launch migration: 
```ruby
rails db:migrate
```

5. Create a model User: 
```ruby
rails g devise User firstname lastname
```
In the migration file: uncheck the following:
```ruby
# Confirmable
t.string   :confirmation_token
t.datetime :confirmed_at
t.datetime :confirmation_sent_at
t.string   :unconfirmed_email # Only if using reconfirmable
```
Add ‘confirmable’ in user.rb file
Add a constraint in DB (add ‘null: false’ behind first name and lastname) to get this:

```ruby
t.string :firstname           null: false
t.string :lastname            null: false
t.string :email,              null: false, default: ""
t.string :encrypted_password, null: false, default: ""
```
Launch migration: 
```ruby
rails db:migrate
```
