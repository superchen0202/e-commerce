FactoryBot.define do
  factory :sku do
    products { nil }
    spec { "MyString" }
    quantity { 1 }
    deleted_at { "2021-01-13 13:43:43" }
  end
end
