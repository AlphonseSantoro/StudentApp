class AddColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :uploads, :description, :string
  end
end
