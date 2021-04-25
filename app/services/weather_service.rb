class WeatherService
  def self.fetch_weather_for_location(lat, long)
    response = conn.get('/data/2.5/onecall') do |request|
      request.params[:lat] = lat
      request.params[:lon] = long
      request.params[:exclude] = "minutely,alerts"
      request.params[:units] = "imperial"
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(url: "https://api.openweathermap.org", params: {
      appid: ENV['OPENWEATHER_API_KEY']
      })
  end
end
