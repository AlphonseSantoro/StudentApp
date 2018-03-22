class RemoveColumnDataFromUploads < ActiveRecord::Migration[5.1]
  def change
    remove_column :uploads, :data, :binary
  end
end
