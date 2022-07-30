class AddApplicationToShips < ActiveRecord::Migration[6.0]
  def change
    add_column :ships, :application, :string
  end
end
