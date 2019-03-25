# Guessing Machine

This README would normally document whatever steps are necessary to get the
application up and running.

## Installation and Dependencies

* Ruby version `Ruby 2.6.1p33` and `Rails 5.2.2.1`

* Installation

  [Install Ruby On Rails on Mac OS X 10.14 Mojave](https://gorails.com/setup/osx/10.14-mojave)

* System dependencies (Gems)
  - `sqlite3`
  - [`bootstrap`](https://github.com/twbs/bootstrap-rubygem)
  - [`chartjs-ror`](https://www.chartjs.org/samples/latest/)
  - [`decisiontree`](https://github.com/igrigorik/decisiontree)

### Decision Tree

  > A Ruby library which implements [ID3 (information gain)](https://en.wikipedia.org/wiki/ID3_algorithm) algorithm for decision tree learning. Currently, continuous and discrete datasets can be learned.

## Configuration
  - To include `main.js` the following to `config/initializers/assets.rb`

   ```ruby
   Rails.application.config.assets.precompile += %w( main.js )
   ````

  - Add the following to `app/assets/javascripts/application.js`

  ```javascript
  bootstrap
  lodash
  Chart.bundle.min
  ```

* Database creation
  ```
  rake db:drop db:create db:migrate db:seed RAILS_ENV=development
  ```

* Starting development server
  ```
  rails s -e development
  ```

## Testing
  To models to use training and testing in various amounts and ratios
  ```
  rails test:models -v RAILS_ENV=development
  ```
  To test basic page functionality
  ```
  rails test:controllers -v RAILS_ENV=test
  ```
  Data used

| Animals  | Height | Weight  |
| ---------|:------:| -------:|
| Dog      | 61.866 |  136.39 |
| Cat      | 70.36  |  185.85 |
| Dog      | 66.117 |  137.61 |

Loading into sqlite3 for flexibility 
```ruby
testing = [
  ["Dog", 0.5787e2, 0.93534e2], ["Cat", 0.70974e2, 0.18498e3], ["Dog", 0.66021e2, 0.14166e3], ["Dog", 0.61964e2, 0.11283e3], ["Dog", 0.65003e2, 0.15606e3], ["Dog", 0.63723e2, 0.14245e3], ["Dog", 0.62361e2, 0.14356e3], ["Cat", 0.68792e2, 0.19768e3]
]

```
