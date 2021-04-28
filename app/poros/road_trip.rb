class RoadTrip
  attr_reader :start_city, :end_city, :travel_time, :weather_at_eta, :id

  def initialize(start_loc, end_loc, time, weather_data)
    @id = nil
    @start_city = start_loc
    @end_city = end_loc
    @travel_time = calculate_travel_time(time)
    @weather_at_eta = compile_weather(weather_data, time)
  end

  def calculate_travel_time(time)
    if time.class != Integer
      return "impossible route"
    else
      hours = (time/3600).to_i
      minutes = ((time % 3600) % 60)
      return "#{hours} hours, #{minutes} minutes"
    end
  end

  def compile_weather(weather_data, time)
    index = (time/3600).to_i
    hourly = weather_data[index]
    { temperature: hourly.temperature, conditions: hourly.conditions }
  end
end
