# == Schema Information
#
# Table name: guesses
#
#  id         :integer          not null, primary key
#  pet_guess  :string
#  height     :float
#  weight     :float
#  is_correct :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  Weight low: 64.70012671, high: 269.9896985
#
#  Cat people avg height is 69.02634591 (low: 58.40690493, high: 78.99874235)
#  Cat people avg weight is 187.0206207 (low: 112.9029394, high: 269.9896985)
#  Cat low 6 : 11, gcf: 10 (mean 5)
#  Cat high 8 : 27, gcf: 10 (diff 17)
#  Cat avg 7 : 19, gcf: 10 (dif 12)
#
#  Dog people avg height is 63.7087736 (low: 54.26313333, high: 73.38958587)
#  Dog people avg weight is 135.860093 (low: 64.70012671, high: 202.2372137)
#  Dog low 5 : 6, gcf: 10 (mean 5)
#  Dog high 7 : 20, gcf: 10 (mean 13)
#  Dog avg 3 : 7, gcf: 20 (diff 4)
#

class Guess < ApplicationRecord
  validates :height, presence: true
  validates :weight, presence: true
  validates :pet_guess, presence: true

  def hello
    "Hello"
  end
  
  # Feedback data
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

end
