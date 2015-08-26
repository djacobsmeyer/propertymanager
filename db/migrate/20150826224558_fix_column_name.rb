class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :receivables, :vendor, :payer
  end
end
