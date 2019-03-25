require 'test_helper'
require 'decisiontree'

class AnimalHeightWeightTest < ActiveSupport::TestCase
  def setup
    @animal = AnimalHeightWeight.new
  end

  test "find all animals that are dogs" do
    assert_equal(@animal.dog_rows.group(:animal).pluck(:animal).pop, 'Dog', "Only dogs found")
  end

  test "find all animals that are cats" do
    assert_equal(@animal.cat_rows.group(:animal).pluck(:animal).pop, 'Cat', "Only cats found")
  end

  test "find training data" do
    assert_equal(@animal.training_set().count, 200, 'Invalid training set')
    assert_equal(@animal.training_set(500).count, 500, 'Invalid training set')
  end

  test "find testing data" do
    assert_equal(@animal.testing_set().count, 800, 'Invalid test set')
    assert_equal(@animal.testing_set(800, 200).count, 800, 'Invalid test set')
    assert_equal(@animal.testing_set(600).count, 600, 'Invalid test set')
  end

  test "train and test with very low training amount" do
    guessing_using_decision_tree()
  end

  test "train and test with small sample" do
    guessing_using_decision_tree(20, 100)
  end

  test "train and test with medium sample" do
    guessing_using_decision_tree(500, 4000)
  end

  test "train and test with extra large sample" do
    guessing_using_decision_tree(800, 6000)
  end

  test "train and test with all the data 1:9" do
    guessing_using_decision_tree(1000, 9000)
  end

  def guessing_using_decision_tree(train = 5, test = 500)

    @animal = AnimalHeightWeight.new

    attributes = @animal.data_set_label
    training   = @animal.training_set(train)
    tests      = @animal.testing_set(test, train)

    dec_tree = DecisionTree::ID3Tree.new(attributes, training, 'Dog', Animal: :discrete, Height: :continuous, Weight: :continuous)
    dec_tree.train

    tests.each do | test |
      decision = dec_tree.predict(test)
      # puts "Predicted: #{decision} ... True decision: #{test.last} ... Test #{test}"
      assert_equal(decision, test.last, "failed guess")
    end

  end
end
