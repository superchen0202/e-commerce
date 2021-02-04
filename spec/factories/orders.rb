FactoryBot.define do
  factory :order do
    number { "MyString" }
    user { nil }
    reciever { "MyString" }
    phone { "MyString" }
    address { "MyString" }
    note { "MyText" }
    state { "MyString" }
    transcation_id { "MyString" }
    paid_at { "2021-02-04 22:34:25" }
    deleted_at { "2021-02-04 22:34:25" }
  end
end
