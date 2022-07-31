class CreateOccurrences < ActiveRecord::Migration[6.0]
  def change
    create_table :occurrences do |t|
      t.date :date
      t.time :time
      t.float :latitude
      t.float :longitude
      t.string :ship_origin
      t.string :ship_destination
      t.string :type
      t.string :description
      t.references :user, null: false, foreign_key: true
      t.references :ship, null: false, foreign_key: true

      t.timestamps
    end
  end
end
