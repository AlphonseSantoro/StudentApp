class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :uploads, :type, :filetype
  end
end
