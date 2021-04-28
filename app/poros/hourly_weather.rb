class HourlyWeather
  attr_reader :time, :temperature, :conditions, :icon

  def initialize(data, offset)
    @time = Time.at(data[:dt] + offset).strftime("%T")
    @temperature = data[:temp]
    @conditions = data[:weather][0][:description]
    @icon = data[:weather][0][:icon]
  end
end
