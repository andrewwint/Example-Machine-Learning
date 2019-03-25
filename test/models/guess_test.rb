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
  guess = Guess.new

  test "find training data for guessing" do
    assert_equal(guess.training_set_seed().count, 200, 'Invalid training set')
    assert_equal(guess.training_set_seed(100).count, 100, 'Invalid training set')
    assert(guess.training_set.count > 1, 'No traing data found')
  end

  test "test if user likes dogs" do
    assert_equal(guess.guess_animal(55, 134,'Dog'), "Dog", "Failed 'Dog' guess")
  end
end
