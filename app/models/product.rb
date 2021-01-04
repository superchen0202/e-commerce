class Product < ApplicationRecord

  acts_as_paranoid

  include CodeGenerator

  #relation
  belongs_to :vendor

  #validation
  #validates :code, uniqueness: true
  validates :name, presence: true
  validates :list_price, :sell_price, numericality:{ greater_than: 0, allow_nil: true}
  

end