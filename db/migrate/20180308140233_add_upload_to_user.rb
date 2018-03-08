class AddUploadToUser < ActiveRecord::Migration
  def change
    add_foreign_key :uploads, :users
  end
end
