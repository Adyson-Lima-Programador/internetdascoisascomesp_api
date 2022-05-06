class User < ApplicationRecord
  
  has_many :devices, dependent: :destroy
  validates :name, :email, :password, :category, presence: true

end
