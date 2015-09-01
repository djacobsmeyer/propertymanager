class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :receivable, index: true, foreign_key: true
      t.string :itemname
      t.text :description
      t.integer :value

      t.timestamps null: false
    end
  end
end
