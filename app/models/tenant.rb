class Tenant < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :property
  has_one :user, through: :property
  has_many :receivables, through: :property
  has_many :requests
  default_scope { order('updated_at DESC') }
end
