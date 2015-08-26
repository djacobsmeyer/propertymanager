class CreatePayables < ActiveRecord::Migration
  def change
    create_table :payables do |t|
      t.references :property, index: true, foreign_key: true
      t.string :vendor
      t.datetime :date
      t.datetime :duedate
      t.integer :amount

      t.timestamps null: false
    end
  end
end
