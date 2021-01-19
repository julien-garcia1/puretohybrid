class Ticket < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :product, optional: true
  validates :section, presence: true
  has_many :reviews, dependent: :destroy
end
