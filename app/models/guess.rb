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

  def dog_avg_ratio
    # Return avg ratio from collected data
    '1:2'
  end

  def cat_avg_ratio
    # Return avg ratio from collected data
    '2:5'
  end

  # get training data from guesess if non is set get it from AnimalHeightWeight
  def training_set(limit = 500)
    results = Guess.select([:height, :weight, :pet_guess]).where('is_correct': true).limit(limit).map{
      |e| [e.height.to_f, e.weight.to_f, e.pet_guess.to_s]
    }
    if results.count == 0
      self.training_set_seed()
    end
  end

  # get training data from AnimalHeightWeight models
  def training_set_seed(limit = 200)
    ani_wh = AnimalHeightWeight.new
    ani_wh.training_set(limit)
  end

  # based on the trained model guess the persons pet prefference
  def guess_animal(height, weight, animal)

    ani_wh        = AnimalHeightWeight.new
    attributes    = ani_wh.data_set_label
    training      = self.training_set
    guess         = [height, weight, animal]

    dec_tree = DecisionTree::ID3Tree.new(
      attributes, training, 'Dog', Animal: :discrete, Height: :continuous, Weight: :continuous
    )
    dec_tree.train
    dec_tree.predict(guess)

  end

end
