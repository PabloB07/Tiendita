# Tiendita

Tiendita is a fast base for e-commerce made with Spree gem in Rails 6, and i18n internalization.

## Installation

### Create new Rails app

If you're starting a new application from scrach run (for example):

```bash
rails new store
cd store
```
Is better for you create a new Rails app with Database, like MySQL / MariaDB or other NoSQL like MongoDB, with this parameters:
***Ensure to put yor gem of NoSQL like MongoDB or MySQL / MariaDB databases in your Gemfile*** 
```bash
rails new store -d mysql
cd store
```

You can **add Spree to your existing Rails application** as well.

### Add Spree gems to your `Gemfile`

#### Rails 6.0

```ruby
gem 'spree', '~> 4.1'
gem 'spree_auth_devise', '~> 4.1'
gem 'spree_gateway', '~> 3.7'
```

To see what rails version are you using run this command:

```bash
rails -v
```

Older rails versions are also supported: [Rails 5.1](https://guides.spreecommerce.org/release_notes/3_5_0.html), [Rails 5.0](https://guides.spreecommerce.org/release_notes/3_2_0.html), [Rails 4.2](https://guides.spreecommerce.org/release_notes/3_1_0.html)

### Install gems

```bash
bundle install
```

**Note**: if you run into `Bundler could not find compatible versions for gem "sprockets":` error message, please run

```bash
bundle update
```
### Use the install generators to set up Tiendita

```shell
rails g spree:install --user_class=Spree::User
rails g spree:auth:install
rails g spree_gateway:install
```

## Installation options

By default, the installation generator (`rails g spree:install`) will run
migrations as well as adding seed and sample data and will copy storefront data
for easy customization (if `spree_frontend` available). This can be disabled using

```shell
rails g spree:install --migrate=false --sample=false --seed=false --copy_storefront=false
```

You can always perform any of these steps later by using these commands.

```shell
bundle exec rake railties:install:migrations
bundle exec rails db:migrate
bundle exec rails db:seed
bundle exec rake spree_sample:load
bundle exec rails g spree:frontend:copy_storefront
```
## For i18n Spree >= 3.1
Add the following Gem in your Gemfile:
  ```ruby
  gem 'spree_i18n', github: 'spree-contrib/spree_i18n'
  ```
2. Install the gem using Bundler:
  ```ruby
  bundle install
  ```

3. Copy & run migrations
  ```ruby
  bundle exec rails g spree_i18n:install
  ```

4. Restart your server

  If your server was running, restart it so that it can find the assets properly.

---

## Model Translations

We **removed** support for translating models into [a separate Gem](https://github.com/spree-contrib/spree_globalize).

Please update your `Gemfile` if you still need the model translations.

```ruby
# Gemfile
gem 'spree_globalize', github: 'spree-contrib/spree_globalize', branch: 'master'
```

---

## Upgrading

**WARNING**: If you want to keep your model translations, be sure to add the `spree_globalize` gem to your `Gemfile` **before** migrating the database. Otherwise **you will loose your translations**!

### 1. Migrate your database

    bin/rake spree_i18n:upgrade
    bin/rake db:migrate

*Note:* The migration automatically skips the removal of the translations tables. So it's safe to run the migration without data loss. But be sure to have the `spree_globalize` gem in your `Gemfile`, if you want to keep them.

### 2. Remove Assets

From `vendor/assets/javascripts/spree/backend/all.js`
```
//= require spree/backend/spree_i18n
```

and from `vendor/assets/stylesheets/spree/backend/all.css`
```
*= require spree/backend/spree_i18n
```

## Run rails sever

```bash
rails s
```

## Browse Tiendita Storefront

Go to:

```bash
http://localhost:3000
```

## Browse Tiendita Admin Panel

Go to:

```bash
http://localhost:3000/admin
```
As well you can use the custom port, like 80, following this command:

```bash
rails s -p 80
```
