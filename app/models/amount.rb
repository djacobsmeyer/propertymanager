class Amount < ActiveRecord::Base
  def self.default
    50_00
  end
  
end
