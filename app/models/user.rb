class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :properties

  has_many :tenants, through: :properties

  def manager?
    :type == "Manager"
  end

  def tenant?
    :type == "Tenant"
  end

end
