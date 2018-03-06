class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :filename
      t.string :filetype
      t.integer :size
      t.string :binary_id

      t.timestamps null: false
    end
  end
end
