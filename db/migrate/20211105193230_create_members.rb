class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :name
      t.string :CPF
      t.date :birth
      t.string :license_number
      t.string :doc_number
      t.string :doc_type
      t.string :image

      t.timestamps
    end
  end
end
