# == Schema Information
#
# Table name: guesses
#
#  id             :integer          not null, primary key
#  pet_guess      :string
#  height         :float
#  weight         :float
#  is_correct     :boolean          default(TRUE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require 'decisiontree'

class Guess < ApplicationRecord

  validates :height, presence: true
  validates :weight, presence: true
  validates :pet_guess, presence: true

  def dog_wrong
    Guess.where('is_correct': false, pet_guess: 'Dog').all().count
  end

  def dog_right
    Guess.where('is_correct': true, pet_guess: 'Dog').all().count
  end

  def cat_wrong
    Guess.where('is_correct': false, pet_guess: 'Cat').all().count
  end

  def cat_right
    Guess.where('is_correct': true, pet_guess: 'Cat').all().count
  end

  # random bias
  def bias
    ['Dog', 'Cat'].shuffle.first
  end

  # take all correct and incorect guesses to create an array of correct guesses
  def transfrom_training_set(results)
    data = results.each.map{|e|
      if e.is_correct === false and e.pet_guess === 'Dog'
        [e.height.to_i, e.weight.to_i, 'Cat']
      elsif e.is_correct === false and e.pet_guess === 'Cat'
        [e.height.to_i, e.weight.to_i, 'Dog']
      else
        [e.height.to_i, e.weight.to_i, e.pet_guess ]
      end
    }
    data
  end

  # get training data from guesess if none is found then it gets it from AnimalHeightWeight
  def training_set
    results = Guess.select([:is_correct, :height, :weight, :pet_guess]).limit(2000)
    
    data = transfrom_training_set(results)

    if data.count < 20
      self.training_set_seed()
    else
      data
    end
  end

  # get training data from AnimalHeightWeight model
  def training_set_seed(limit = 2000)
    ani_wh = AnimalHeightWeight.new
    ani_wh.training_set(limit)
  end

  # based on the trained model, guess the persons pet prefference
  def guess_animal(height, weight, animal = self.bias)
    ani_wh        = AnimalHeightWeight.new
    attributes    = ani_wh.data_set_label
    training      = self.training_set
    test          = [height, weight, animal]

    dec_tree = DecisionTree::ID3Tree.new(
      attributes, training, 'Dog', Animal: :discrete, Height: :continuous, Weight: :continuous
    )
    dec_tree.train
    decision = dec_tree.predict(test)

    # puts "Predicted: #{decision} ... True decision: #{guess.last} ... Test #{guess}"

    decision
  end

end
