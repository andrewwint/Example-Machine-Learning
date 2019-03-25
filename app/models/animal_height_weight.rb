class AnimalHeightWeight < ApplicationRecord

  def dog_rows
    AnimalHeightWeight.where(animal: 'Dog').all()
  end

  def cat_rows
    AnimalHeightWeight.where(animal: 'Cat').all()
  end

  def data_set_label
    ['Height', 'Weight', 'Animal']
  end

  def training_set(limit = 200)
    AnimalHeightWeight.select([:height, :weight, :animal]).limit(limit).map{
      |e| [e.height.to_i, e.weight.to_i, e.animal.to_s]
    }
  end

  def testing_set(limit = 800, offset = 200)
    AnimalHeightWeight.select([:height, :weight, :animal]).limit(limit).offset(offset).map{
      |e| [e.height.to_i, e.weight.to_i, e.animal.to_s]
    }
  end

end
