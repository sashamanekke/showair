class Shower < ApplicationRecord
  has_attachments :pictures,  maximum: 3
  geocoded_by :address

  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :availibilities, dependent: :destroy


  after_validation :geocode, if: :address_changed?
end
