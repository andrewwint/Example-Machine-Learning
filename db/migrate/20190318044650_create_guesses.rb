class CreateGuesses < ActiveRecord::Migration[5.2]
  def change
    create_table :guesses do |t|
      t.string :pet_guess
      t.float :height
      t.float :weight
      t.boolean :is_correct, null: true, default: false

      t.timestamps
    end
  end
end
