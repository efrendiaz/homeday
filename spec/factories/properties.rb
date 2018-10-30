FactoryBot.define do
  factory :property do
    offer_type {'sell'}
    property_type {'apartment'}
    zip_code {'10585'}
    city {'Berlin'}
    location {"POINT(#{52.5166023} #{13.3041054 })"}
    construction_year {1998}
    number_of_rooms {3.0}
    currency {'eur'}
    price {540000.00}
  end
end
