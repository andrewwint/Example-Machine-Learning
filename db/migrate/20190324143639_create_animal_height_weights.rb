class CreateAnimalHeightWeights < ActiveRecord::Migration[5.2]
  def change
    create_table :animal_height_weights do |t|
      t.string :animal
      t.float :height
      t.float :weight
      t.timestamps
    end
    add_index :animal_height_weights, :animal
  end
end
