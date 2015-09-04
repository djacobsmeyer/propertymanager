class Tenant < ActiveRecord::Base
  belongs_to :property
  has_one :user, through: :property
  has_many :requests
  default_scope { order('updated_at DESC') }
end
