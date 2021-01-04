FactoryBot.define do
  factory :product do
    name { "MyString" }
    code { "MyString" }
    list_price { "9.99" }
    sell_price { "9.99" }
    vendor { nil }
    on_sell { false }
    deleted_at { "2021-01-04 15:55:44" }
  end
end
