class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :tenant, index: true, foreign_key: true
      t.string :title
      t.text :description
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
