class OrderItem < ApplicationRecord
  belongs_to :user
  belongs_to :skus
end
