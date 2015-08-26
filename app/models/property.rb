class Property < ActiveRecord::Base
  belongs_to :user
  has_many :tenants
  has_many :receivables
  has_many :payables

  default_scope { order('updated_at DESC') }
end
