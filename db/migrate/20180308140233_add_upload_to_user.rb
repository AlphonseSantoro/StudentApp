class AddUploadToUser < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :uploads, :users
  end
end
