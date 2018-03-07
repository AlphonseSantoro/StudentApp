class AddUserIdColumnToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :users_id, :integer
  end
end
