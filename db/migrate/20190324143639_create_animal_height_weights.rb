class CreateAnimalHeightWeights < ActiveRecord::Migration[5.2]
  def change
    create_table :animal_height_weights do |t|
      t.string :animal
      t.decimal :height, precision: 5, scale: 9
      t.decimal :weight, precision: 5, scale: 9
      t.timestamps
    end
    add_index :animal_height_weights, :animal
  end
end
