class Receivable < ActiveRecord::Base
  belongs_to :property
  has_many :line_items
  has_one :tenant 

  default_scope { order('updated_at DESC') }
end
