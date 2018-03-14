class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.binary :text
      t.integer :uploads_id
      t.integer :users_id

      t.timestamps null: false
    end
  end
end
