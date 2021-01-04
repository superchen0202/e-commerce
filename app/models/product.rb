class Product < ApplicationRecord
  

  #relation
  belongs_to :vendor

  #validation
  #validates :code, uniqueness: true
  validates :name, presence: true
  validates :list_price, :sell_price, numericality:{ greater_than: 0, allow_nil: true}
  
  #module of friendly_id
  extend FriendlyId
  friendly_id :code_generator, use: :slugged, slug_column: :code


  private
  def code_generator
    SecureRandom.hex(10)
  end

end