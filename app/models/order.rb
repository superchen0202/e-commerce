class Order < ApplicationRecord
  
  include AASM

  belongs_to :user
  has_many :order_items

  validates :receipent, presence: true
  validates :tel, presence: true
  validates :address, presence: true

  before_create :generate_order_num

  aasm column: 'state' do

    state :pending, initial: true
    state :paid, :delivered

    event :pay do
      transitions from: :pending, to: :paid

      # before do |args|
      #   self.transaction_id = args[:transaction_id]
      #   self.paid_at = Time.now
      # end
    end

    event :deliver do
      transitions from: :paid, to: :delivered
    end

    # event :cancel do
    #   transitions from: [:pending, :paid, :delivered], to: :cancelled
    # end
  end

  def total_price
    order_items.reduce(0) { |sum, item| sum + item.total_price }
  end

  private
  def generate_order_num
    self.num = SecureRandom.hex(5) unless num
  end

end