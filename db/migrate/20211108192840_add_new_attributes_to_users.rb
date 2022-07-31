class AddNewAttributesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :cpf, :string
    add_column :users, :matricula, :string
    add_column :users, :lotacao, :string
    add_column :users, :admin, :boolean, null: false, default: false

  end
end
