class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :filename
      t.string :filetype
      t.integer :size
      t.string :binary_id
      t.integer :users_id
      t.binary  :data,  limit: 16.megabyte

      t.timestamps null: false
    end
  end
end
