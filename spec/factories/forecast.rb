FactoryBot.define do
  factory :forecast do
    current_weather { create(:current_weather) }
    daily_weather { create_list(:daily_weather, count: 5) }
    hourly_weather { create_list(:hourly_weather, count: 8) }
  end
end
