class AddColumnToUser < ActiveRecord::Migration[4.2]
  def change
    add_column :uploads, :description, :string
  end
end
