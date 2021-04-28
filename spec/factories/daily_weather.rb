FactoryBot.define do
  factory :daily_weather do
    date { Faker::Date.in_date_period(month: 5).to_s }
    sunrise { Faker::Time.between(from: DateTime.now - 5, to: DateTime.now) }
    sunset { Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 6) }
    max_temp { Faker::Number.between(from: 70, to: 75.5) }
    min_temp { Faker::Number.between(from: 65, to: 69.5) }
    conditions { Faker::Gender.type }
    icon { Faker::Alphanumeric.alphanumeric(number: 3) }
  end
end
