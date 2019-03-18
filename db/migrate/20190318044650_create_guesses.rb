class CreateGuesses < ActiveRecord::Migration[5.2]
  def change
    create_table :guesses do |t|
      t.string :pet
      t.float :height
      t.float :weight
      t.boolean :answer, :default => true 

      t.timestamps
    end
  end
end
