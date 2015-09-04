class Receivable < ActiveRecord::Migration
  def change
    change_column :receivables, :date, :date
    change_column :receivables, :duedate, :date
  end
end
