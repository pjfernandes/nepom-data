class AddDescriptionToOccurrences < ActiveRecord::Migration[6.0]
  def change
    add_column :occurrences, :description, :text
  end
end
