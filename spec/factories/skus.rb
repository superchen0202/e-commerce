FactoryBot.define do
  
  factory :sku do
    
    spec { Faker::Name.name }
    quantity { Faker::Number.between(from: 1, to: 10) }
    
    product
    #deleted_at { "2021-01-13 14:46:02" }
  end

end