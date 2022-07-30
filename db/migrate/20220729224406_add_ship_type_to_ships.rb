class AddShipTypeToShips < ActiveRecord::Migration[6.0]
  def change
    add_column :ships, :ship_type, :string
  end
end
