class Product < ApplicationRecord

  acts_as_paranoid

  include CodeGenerator

  #relation
  belongs_to :vendor
  belongs_to :category, optional: true
  
  has_many :skus
  accepts_nested_attributes_for :skus, reject_if: :all_blank, allow_destroy: true
  
  has_rich_text :description
  has_one_attached :cover_image

  #the maximun anount of data can show in every one page
  paginates_per 5

  #validation
  validates :code, uniqueness: true
  validates :name, presence: true
  validates :list_price, :sell_price, numericality:{ greater_than: 0, allow_nil: true}
  
end