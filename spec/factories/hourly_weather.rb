FactoryBot.define do
  factory :hourly_weather do
    time { Time.now.strftime("%T") }
    temperature { Faker::Number.between(from: 70, to: 75.5) }
    conditions { Faker::Gender.type }
    icon { Faker::Alphanumeric.alphanumeric(number: 3) }
  end
end
