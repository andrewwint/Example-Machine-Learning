class AnimalHeightWeight < ApplicationRecord
  def hello
    "Hello"
  end
  def dog_rows
    AnimalHeightWeight.where(animal: 'Dog').all()
  end

  def cat_rows
    AnimalHeightWeight.where(animal: 'Cat').all()
  end
end
