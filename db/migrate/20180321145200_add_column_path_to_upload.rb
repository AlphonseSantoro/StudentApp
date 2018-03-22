class AddColumnPathToUpload < ActiveRecord::Migration[5.1]
  def change
    add_column :uploads, :path, :string
  end
end
