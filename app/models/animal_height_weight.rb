class AnimalHeightWeight < ApplicationRecord

  def dog_rows
    AnimalHeightWeight.where(animal: 'Dog').all()
  end

  def cat_rows
    AnimalHeightWeight.where(animal: 'Cat').all()
  end

  def y_max
    AnimalHeightWeight.maximum("height")
  end

  def x_max
    AnimalHeightWeight.maximum("weight")
  end

  def y_mean
    AnimalHeightWeight.average("height")
  end

  def x_mean
    AnimalHeightWeight.average("weight")
  end

  def data_set_label
    ['Height', 'Weight', 'Animal']
  end

  def training_set(limit = 200)
    AnimalHeightWeight.select([:height, :weight, :animal]).limit(limit).map{
      |e| [e.height.to_f, e.weight.to_f, e.animal.to_s]
    }
  end

  def testing_set(limit = 800, offset = 200)
    AnimalHeightWeight.select([:height, :weight, :animal]).limit(limit).offset(offset).map{
      |e| [e.height.to_f, e.weight.to_f, e.animal.to_s]
    }
  end


end
