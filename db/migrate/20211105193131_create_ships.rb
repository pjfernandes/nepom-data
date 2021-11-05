class CreateShips < ActiveRecord::Migration[6.0]
  def change
    create_table :ships do |t|
      t.string :name
      t.string :registration
      t.string :registration_port
      t.string :image

      t.timestamps
    end
  end
end
