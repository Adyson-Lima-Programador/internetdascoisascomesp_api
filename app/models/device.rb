class Device < ApplicationRecord

  belongs_to :user
  validates :name, :description, :user_id, :status, :request_count, :category, presence: true

end
