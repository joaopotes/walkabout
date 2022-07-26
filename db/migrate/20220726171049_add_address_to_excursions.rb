class AddAddressToExcursions < ActiveRecord::Migration[6.1]
  def change
    add_column :excursions, :address, :string
  end
end
