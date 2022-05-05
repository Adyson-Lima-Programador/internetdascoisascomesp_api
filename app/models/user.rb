class User < ApplicationRecord

  validates :name, :email, :password, :category, presence: true

end
