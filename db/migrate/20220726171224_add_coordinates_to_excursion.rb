class AddCoordinatesToExcursion < ActiveRecord::Migration[6.1]
  def change
    add_column :excursions, :latitude, :float
    add_column :excursions, :longitude, :float
  end
end
