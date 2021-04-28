class Forecast
  attr_reader :current_weather, :daily_weather, :hourly_weather, :id

  def initialize(data, hourly_limit = 8)
    @id = nil
    @current_weather = CurrentWeather.new(data[:current], data[:timezone_offset])
    @daily_weather = compile_daily_weather(data[:daily].first(5), data[:timezone_offset])
    @hourly_weather = compile_hourly_weather(data[:hourly].first(hourly_limit), data[:timezone_offset])
  end

  def compile_daily_weather(data, offset)
    data.map do |day|
      DailyWeather.new(day, offset)
    end
  end

  def compile_hourly_weather(data, offset)
    data.map do |hour|
      HourlyWeather.new(hour, offset)
    end
  end
end
