class Room < ApplicationRecord
  belongs_to :user
  belongs_to :reservations
  mount_uploader :image, ImageUploader
end
