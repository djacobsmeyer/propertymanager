class Property < ActiveRecord::Base
  belongs_to :user
  has_many :tenants
  
end
