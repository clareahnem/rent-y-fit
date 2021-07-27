class User < ApplicationRecord
  has_one :address
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence:true
  accepts_nested_attributes_for :address

  def with_address
    # for nested form in sign_up page
    build_address if address.nil?
    self
  end
end
