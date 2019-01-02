class AddSlugToLists < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :slug, :string
    add_index :lists, :slug, unique: true
  end
end
