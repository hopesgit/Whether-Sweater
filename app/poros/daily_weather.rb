class DailyWeather
  attr_reader :date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon

  def initialize(data, offset)
    @date = (Time.at(data[:dt]) + offset).strftime("%F")
    @sunrise = (Time.at(data[:sunrise]) + offset).to_s
    @sunset = (Time.at(data[:sunset]) + offset).to_s
    @max_temp = data[:temp][:max]
    @min_temp = data[:temp][:min]
    @conditions = data[:weather][0][:description]
    @icon = data[:weather][0][:icon]
  end
end
