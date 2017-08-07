class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.references :brand, foreign_key: true
      t.text :description
      t.float :price

      t.timestamps
    end
  end
end
