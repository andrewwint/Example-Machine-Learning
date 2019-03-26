# Guessing Machine

This a Rails application that takes in a users height and weight to predict if they like Dogs or Cats. It uses **ID3 (Iterative Dichotomiser 3)** is an algorithm invented by [Ross Quinlan](https://en.wikipedia.org/wiki/Ross_Quinlan) used to generate a decision tree from a dataset. 

## Overview and Objectives
Overall approach as in any software and network application is the attempt to adhere to **[Roy Fielding’s REST Architecture](http://www.ics.uci.edu/~fielding/pubs/dissertation/fielding_dissertation.pdf)** where the goal it align with any number of his 7 principals around *__Performance__, __Scalability__, __Simplicity__, __Modifiability__, __Visibility__, __Portability__, and __Reliability__* where they best apply.
Secondary objective was to create an easy to user interface where the participant would be provided with a simple to use interface that wouldn't be intimidating and games like. 
 * **Performance:** As the main consideration given that is a key part of the user experience, where interactions are app-like getting as close as possible to 60fps or less than 4 milliseconds for content loading __'time to interact and first meaningful paint'__. So considering factors such as database performance, loading of assets and simplicity of the overall architecture. 
 * **Scalability & Modifiability:** Both from a business and developer perspective, the attempt was design the application to be self-scaling as more users engage with the application therefore more training data would be captured to provide greater guessing accuracy. Keeping in mind easy to read and understand code so any developer can quickly make improvements. Also making it easy to test and to have intraspection into how the application operates.
 * **Visibility & Reliability:** Using comprehensive unit tests to the critical aspects of classification algorithm accuracy as well as  performance. The unit test attempt to expose what is the threshold amount of training data needed for the highest correct responses.
 * **Portability:** At minimum with the use of migration and seeders to interact with the test data for __Reliability__

In summary the attempt is to 'Fall into the Pit of Success' and avoid a ['Big Ball of Mud'](http://www.laputan.org/pub/foote/mud.pdf)

## Installation and Dependencies

* Ruby version `Ruby 2.6.1p33` and `Rails 5.2.2.1`

### Installation

  [Install Ruby On Rails on Mac OS X 10.14 Mojave](https://gorails.com/setup/osx/10.14-mojave)

### System dependencies (Gems)
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
  //= require jquery3
  //= require popper
  //= require bootstrap-sprockets
  //= require Chart.bundle.min
  ```

  - Database creation
  ```
  rake db:drop db:create db:migrate db:seed RAILS_ENV=development
  ```

  - Starting development server
  ```
  rails s -e development
  ```

## Testing
  To models to use training and testing in various amounts and ratios
  ```
  rails test:models -v RAILS_ENV=development
  ```
  - This is an expected result when testing models, this just means `decisiontree` needs more training data
  ```
  Failed random guess.
Expected: "Dog"
  Actual: "Cat"
  ```

  To test basic page functionality
  ```
  rails test:controllers -v RAILS_ENV=test
  ```
### CSV Data, SQL and ActiveRecord

| Animals  | Height | Weight  |
| ---------|:------:| -------:|
| Dog      | 61.866 |  136.39 |
| Cat      | 70.36  |  185.85 |
| Dog      | 66.117 |  137.61 |

- CSV data loaded into sqlite3 for flexibility to sort, shuffle, and slice easily
```ruby
testing = [
  ["Dog", 0.5787e2, 0.93534e2], ["Cat", 0.70974e2, 0.18498e3], ["Dog", 0.66021e2, 0.14166e3], ["Dog", 0.61964e2, 0.11283e3], ["Dog", 0.65003e2, 0.15606e3], ["Dog", 0.63723e2, 0.14245e3], ["Dog", 0.62361e2, 0.14356e3], ["Cat", 0.68792e2, 0.19768e3]
]

```

### Default Settings

| Settings  | Value | Notes  |
| ---------|:------:| -------|
| Default seed training data      | 2000 |   |
| Bias      | Random  |  'Dog', 'Cat' |
| Real training data threshold       | 20 |  after the 20th human entered inputs the system stop using seed data from CSV |
| Real training data  | 2000 |  |

## Performance Benchmarks
__local testing__
![Performance](https://raw.githubusercontent.com/andrewwint/GuessingMachine/master/app/assets/images/performance-report.png "Performance")

__Unit testing on the imported sample data__

```
$ rails test:controllers -v RAILS_ENV=test
Run options: --seed 53456

# Running:

Finished in 1.867194s, 6.9623 runs/s, 10246.9267 assertions/s.
13 runs, 19133 assertions, 2 failures, 0 errors, 0 skips
```
