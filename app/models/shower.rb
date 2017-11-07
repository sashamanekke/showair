class Shower < ApplicationRecord
  has_attachments :pictures,  maximum: 3

  belongs_to :user
  has_many :reservations, dependent: :destroy
end
