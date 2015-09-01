class Payable < ActiveRecord::Base
  belongs_to :property

  default_scope { order('updated_at DESC') }
end
