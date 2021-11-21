class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations, foreign_key: "room_id"
  has_one_attached :image
  
  validates :name, presence: true
  validates :content, presence: true
  validates :price, numericality: true
  validates :address, presence: true
  validates :image, presence: true
end
