# FactoryBot.define do
#   factory :forecast do
#     current_weather { { datetime: Time.now, sunrise: Time.now - 3600, sunset: Time.now + 3600, temperature: Faker::Number.decimal(l_digits: 2, r_digits: 1), feels_like: Faker::Number.decimal(l_digits: 2, r_digits: 1), uvi: Faker::Number.between(from: 0.01, to: 2.00), humidity: Faker::Number.number(digits: 2), conditions: Faker::String.random(length: 4), icon: Faker::String.random(length: 4) } }
#     daily_weather { [{}] }
#   end
# end
