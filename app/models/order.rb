class Order < ApplicationRecord
  
  belongs_to :user
  has_many :order_items

  validates :receipent, presence: true
  validates :tel, presence: true
  validates :address, presence: true
  

end