class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.references :property, index: true, foreign_key: true
      t.string :name
      t.datetime :leasestart
      t.datetime :leaseend

      t.string :address
      t.string :city
      t.string :state
      t.integer :zipcode

      t.timestamps null: false
    end
  end
end
