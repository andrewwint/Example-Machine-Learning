# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

https://gorails.com/setup/osx/10.14-mojave

* Ruby version
 `Ruby 2.6.1p33` and `Rails 5.2.2.1`

* System dependencies
  `sqlite3`

* Configuration
  - To include `main.js` ensure `Rails.application.config.assets.precompile += %w( main.js )`
  is added to `config/initializers/assets.rb`

  - Follow installation steps for `bootstrap`, `lodash`, and `Chart.bundle.min` in `app/assets/javascripts/application.js`

* Database creation
  ``rake db:drop db:create
    rake db:migrate db:seed RAILS_ENV=development
  ``

* Starting development server
  `rails s -e development`


* How to run the test suite
  `rails test:models -v RAILS_ENV=development`
  
  `rails test:controllers -v RAILS_ENV=test`

* Charts

https://www.chartjs.org/samples/latest/
