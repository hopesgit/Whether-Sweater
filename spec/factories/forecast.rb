FactoryBot.define do
  factory :forecast, class: Forecast do
    current_weather { attributes_for(:current) }
    daily_weather { attributes_for(:daily, 5) }
    hourly_weather { attribtues_for(:hourly, 8) }

    initialize_with {}
  end

  factory :current, class: CurrentWeather do
    datetime { Time.now.to_s }
    sunrise { (Time.now - 3600).to_s }
    sunset { (Time.now + 3600).to_s }
    max_temp { Faker::Number.between(from: 70, to: 75.5) }
    min_temp { Faker::Number.between(from: 65, to: 69.5) }
    humidity { Faker::Number.decimal_part(digits: 4) }
    uvi { Faker::Number.between(from: 0, to: 5) }
    visibility { Faker::Number.number(digits: 5) }
    conditions { Faker::Gender.type }
    icon { Faker::Alphanumeric.alphanumeric(number: 3) }

    initialize_with { new(attributes, -21600)}
  end

  factory :daily, class: DailyWeather do
    date { Faker::Date.in_date_period(month: 5).to_s }
    sunrise { Faker::Time.between(from: DateTime.now - 5, to: DateTime.now) }
    sunset { Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 6) }
    max_temp { Faker::Number.between(from: 70, to: 75.5) }
    min_temp { Faker::Number.between(from: 65, to: 69.5) }
    conditions { Faker::Gender.type }
    icon { Faker::Alphanumeric.alphanumeric(number: 3) }

    initialize_with { new(attributes)}
  end

  factory :hourly, class: HourlyWeather do
    time { Time.now.strftime("%T") }
    temperature { Faker::Number.between(from: 70, to: 75.5) }
    conditions { Faker::Gender.type }
    icon { Faker::Alphanumeric.alphanumeric(number: 3) }

    initialize_with { new(attributes)}
  end
end
