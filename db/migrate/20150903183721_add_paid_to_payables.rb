class AddPaidToPayables < ActiveRecord::Migration
  def change
    add_column :payables, :paid, :boolean
    add_column :receivables, :received, :boolean
  end
end
