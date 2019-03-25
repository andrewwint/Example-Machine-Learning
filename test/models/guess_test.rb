# == Schema Information
#
# Table name: guesses
#
#  id         :integer          not null, primary key
#  pet_guess  :string
#  height     :float
#  weight     :float
#  is_correct  :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'



class GuessTest < ActiveSupport::TestCase

  def setup
    @guess = Guess.new
  end

  test "find training data for guessing" do
    assert_equal(@guess.training_set_seed().count, 5000, 'Invalid training set')
    assert_equal(@guess.training_set_seed(100).count, 100, 'Invalid training set')
    assert(@guess.training_set.count > 1, 'No traing data found')
  end

  test "test if user likes dogs" do
    assert_equal(@guess.guess_animal(55, 134,'Dog'), "Dog", "Failed 'Dog' guess")
    assert_equal(@guess.guess_animal(63, 133,'Dog'), "Dog", "Failed 'Dog' guess")
    assert_equal(@guess.guess_animal(68, 144,'Dog'), "Dog", "Failed 'Dog' guess")
    assert_equal(@guess.guess_animal(68, 161,'Dog'), "Dog", "Failed 'Dog' guess")
    assert_equal(@guess.guess_animal(70, 202,'Dog'), "Dog", "Failed 'Dog' guess")
  end

  test "test if user likes cats" do
    assert_equal(@guess.guess_animal(72, 198,'Cat'), "Cat", "Failed 'Cat' guess")
    assert_equal(@guess.guess_animal(70, 192,'Cat'), "Cat", "Failed 'Cat' guess")
    assert_equal(@guess.guess_animal(67, 170,'Cat'), "Cat", "Failed 'Cat' guess")
    assert_equal(@guess.guess_animal(67, 176,'Cat'), "Cat", "Failed 'Cat' guess")
    assert_equal(@guess.guess_animal(70, 202,'Cat'), "Cat", "Failed 'Cat' guess")
  end

  test "test if user likes dogs with knowing the answer" do
    assert_equal(@guess.guess_animal(55, 134, @guess.bias), @guess.bias, "Failed random guess")
    assert_equal(@guess.guess_animal(63, 133, @guess.bias), @guess.bias, "Failed random guess")
    assert_equal(@guess.guess_animal(68, 144, @guess.bias), @guess.bias, "Failed random guess")
    assert_equal(@guess.guess_animal(68, 161, @guess.bias), @guess.bias, "Failed random guess")
    assert_equal(@guess.guess_animal(70, 202, @guess.bias), @guess.bias, "Failed random guess")
    assert_equal(@guess.guess_animal(72, 198, @guess.bias), @guess.bias, "Failed random guess")
    assert_equal(@guess.guess_animal(70, 192, @guess.bias), @guess.bias, "Failed random guess")
    assert_equal(@guess.guess_animal(67, 170, @guess.bias), @guess.bias, "Failed random guess")
    assert_equal(@guess.guess_animal(67, 176, @guess.bias), @guess.bias, "Failed random guess")
    assert_equal(@guess.guess_animal(70, 202, @guess.bias), @guess.bias, "Failed random guess")
  end

end
