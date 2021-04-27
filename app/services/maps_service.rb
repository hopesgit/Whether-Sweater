class MapsService
  def self.fetch_coordinates(location)
    response = conn.get('/geocoding/v1/address') do |request|
      request.params[:location] = location
      request.params[:maxResults] = 1
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.fetch_directions(start_loc, end_loc)
    response = conn.get('/directions/v2/route') do |request|
      request.params[:from] = start_loc
      request.params[:to] = end_loc
    end

    JSON.parse(response.body, symbolize_names: true)[:route]
  end

  private

  def self.conn
    Faraday.new(url: "http://www.mapquestapi.com", params: {
      key: ENV['MAPQUEST_API_KEY']
      })
  end
end
