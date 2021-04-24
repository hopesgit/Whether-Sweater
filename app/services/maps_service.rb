class MapsService
  def self.fetch_weather(location)
    response = conn.get('/geocoding/v1/address') do |request|
      request.params[:location] = location
      request.params[:maxResults] = 1
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(url: "http://www.mapquestapi.com", params: {
      key: ENV['MAPQUEST_API_KEY']
      })
  end
end
