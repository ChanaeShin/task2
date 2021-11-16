class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations
  mount_uploader :image, ImageUploader
  
  validates :name, presence: true
  validates :intro, length: { in: 10..100 }
  validates :price, numericality: true
  validates :address, presence: true
  validates :image, presence: true

end
