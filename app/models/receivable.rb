class Receivable < ActiveRecord::Base
  belongs_to :property
  has_many :line_items
end
