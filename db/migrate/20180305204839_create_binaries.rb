class CreateBinaries < ActiveRecord::Migration
  def change
    create_table :binaries do |t|
      t.binary :data

      t.timestamps null: false
    end
  end
end
