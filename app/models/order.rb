class Order < ApplicationRecord
  has_many :products
  belongs_to :customer, optional: true

  validates :status, inclusion: { in: ["delivered", "on its way", "waiting for delivery"] }
end
