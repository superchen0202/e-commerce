class Product < ApplicationRecord

  acts_as_paranoid

  include CodeGenerator

  #relation
  belongs_to :vendor
  has_rich_text :description
  
  paginates_per 5


  #validation
  #validates :code, uniqueness: true
  validates :name, presence: true
  validates :list_price, :sell_price, numericality:{ greater_than: 0, allow_nil: true}
  

end