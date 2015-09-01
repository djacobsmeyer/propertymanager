class AddCompanyToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :company, :string
  end
end
