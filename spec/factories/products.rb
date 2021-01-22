FactoryBot.define do

  factory :product do
  
    name { Faker::Name.name }
    list_price { Faker::Number.between(from: 50, to: 100) }
    sell_price { Faker::Number.between(from: 50, to: 100)  }
    on_sell { false }

    vendor
    category
    
  end

end