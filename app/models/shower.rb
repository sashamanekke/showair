class Shower < ApplicationRecord
  has_attachments :picture,  maximum: 2

  belongs_to :user
  has_many :reservations, dependent: :destroy
end
