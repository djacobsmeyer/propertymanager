class AddBillingaddressToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :billingaddress, :string
    add_column :properties, :billingcity, :string
    add_column :properties, :billingstate, :string
    add_column :properties, :billingzipcode, :integer
  end

end
