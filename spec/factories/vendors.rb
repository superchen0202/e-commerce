FactoryBot.define do
  
  factory :vendor do
    
    title {Faker::Name.name}
    online{true}
    description{Faker::Lorem.paragraph}
    
  end

end