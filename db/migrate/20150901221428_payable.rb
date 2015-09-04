class Payable < ActiveRecord::Migration
  def change
    change_column :payables, :date, :date
    change_column :payables, :duedate, :date
  end
end
