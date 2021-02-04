FactoryBot.define do
  factory :order_item do
    user { nil }
    skus { nil }
    quantity { 1 }
  end
end
