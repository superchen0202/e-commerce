FactoryBot.define do
  factory :order do
    num { "MyString" }
    receipent { "MyString" }
    tel { "MyString" }
    address { "MyString" }
    note { "MyText" }
    user { nil }
    state { "MyString" }
    transcation_id { "MyString" }
    paid_at { "2021-02-05 21:34:34" }
    deleted_at { "2021-02-05 21:34:34" }
  end
end
