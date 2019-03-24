ENV["RAILS_ENV"] = "development"
require 'test_helper'

class AnimalHeightWeightTest < ActiveSupport::TestCase

  test "find all animals that are dogs" do
    puts ENV["RAILS_ENV"]
    animal = AnimalHeightWeight.new
    assert_equal(animal.dog_rows.group(:animal).count, '', "Only dogs found")
  end
end
