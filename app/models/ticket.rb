class Ticket < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :product, optional: true
  validates :client_firstname, presence: true
end