class CreateReceivables < ActiveRecord::Migration
  def change
    create_table :receivables do |t|
      t.references :property, index: true, foreign_key: true
      t.string :vendor
      t.integer :amount
      t.datetime :date
      t.datetime :duedate

      t.timestamps null: false
    end
  end
end
