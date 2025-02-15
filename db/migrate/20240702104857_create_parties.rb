class CreateParties < ActiveRecord::Migration[7.1]
  def change
    create_table :parties do |t|
      t.string :ten_letters_list
      t.string :word
      t.boolean :available
      t.integer :score
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
