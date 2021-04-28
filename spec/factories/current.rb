# FactoryBot.define do
#   factory :current, class: CurrentWeather do
#     datetime { Time.now.to_s }
#     sunrise { (Time.now - 3600).to_s }
#     sunset { (Time.now + 3600).to_s }
#     max_temp { Faker::Number.between(from: 70, to: 75.5) }
#     min_temp { Faker::Number.between(from: 65, to: 69.5) }
#     humidity { Faker::Number.decimal_part(digits: 4) }
#     uvi { Faker::Number.between(from: 0, to: 5) }
#     visibility { Faker::Number.number(digits: 5) }
#     conditions { Faker::Gender.type }
#     icon { Faker::Alphanumeric.alphanumeric(number: 3) }
#
#     # initialize_with { new(attributes, -21600)}
#   end
# end
