class ChangeColumnToPost < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :status, :integer, null: false, default: 0
  end
end
