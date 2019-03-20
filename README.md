# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
 `Ruby 2.6.1p33` and `Rails 5.2.2.1`

* System dependencies
  `sqlite3`

* Configuration
  - To include `main.js` ensure `Rails.application.config.assets.precompile += %w( main.js )`
  is added to `config/initializers/assets.rb`
  
  - Follow installation steps for `bootstrap`, `lodash`, and `Chart.bundle.min` in `app/assets/javascripts/application.js`

* Database creation
  `rake db:drop db:create db:migrate`

* How to run the test suite
  `rails test -v`
