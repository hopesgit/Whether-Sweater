class Forecast
  attr_reader :current_weather, :daily_weather, :hourly_weather, :id

  def initialize(data)
    @id = nil
    @current_weather = compile_current_weather(data[:current], data[:timezone_offset])
    @daily_weather = compile_daily_weather(data[:daily].first(5), data[:timezone_offset])
    @hourly_weather = compile_hourly_weather(data[:hourly].first(8), data[:timezone_offset])
  end

  def compile_current_weather(data, offset)
    {
      datetime: (Time.at(data[:dt]) + offset).to_s,
      sunrise: (Time.at(data[:sunrise]) + offset).to_s,
      sunset: (Time.at(data[:sunset]) + offset).to_s,
      temperature: data[:temp],
      feels_like: data[:feels_like],
      humidity: data[:humidity],
      uvi: data[:uvi],
      visibility: data[:visibility],
      conditions: data[:weather][0][:description],
      icon: data[:weather][0][:icon]
    }
  end

  def compile_daily_weather(data, offset)
    data.map do |day|
      {
        date: (Time.at(day[:dt]) + offset).strftime("%F"),
        sunrise: (Time.at(day[:sunrise]) + offset).to_s,
        sunset: (Time.at(day[:sunset]) + offset).to_s,
        max_temp: day[:temp][:max],
        min_temp: day[:temp][:min],
        conditions: day[:weather][0][:description],
        icon: day[:weather][0][:icon]
      }
    end
  end

  def compile_hourly_weather(data, offset)
    data.map do |hour|
      {
        time: Time.at(hour[:dt] + offset).strftime("%T"),
        temperature: hour[:temp],
        conditions: hour[:weather][0][:description],
        icon: hour[:weather][0][:icon]
      }
    end
  end
end
