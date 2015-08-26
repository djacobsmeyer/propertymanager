class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.references :user, index: true, foreign_key: true
      t.string :address
      t.string :city
      t.string :state
      t.integer :zipcode

      t.integer :totalsqft
      t.integer :mortgage

      t.timestamps null: false
    end
  end
end
