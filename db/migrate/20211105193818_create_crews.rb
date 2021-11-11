class CreateCrews < ActiveRecord::Migration[6.0]
  def change
    create_table :crews do |t|
      t.date :date_ini
      t.date :date_fin
      t.string :role
      t.references :member, foreign_key: true
      t.references :ship, foreign_key: true

      t.timestamps
    end
  end
end
