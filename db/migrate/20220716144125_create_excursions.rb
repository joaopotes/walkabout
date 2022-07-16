class CreateExcursions < ActiveRecord::Migration[6.1]
  def change
    create_table :excursions do |t|
      t.string :image
      t.string :name
      t.text :description
      t.string :country
      t.references :user, null: false, foreign_key: true
      t.string :location
      t.float :price
      t.integer :capacity

      t.timestamps
    end
  end
end
