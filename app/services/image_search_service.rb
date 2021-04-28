class ImageSearchService
  def self.fetch_image_from_search_term(term)
    response = conn.get('/v7.0/images/search') do |request|
      request.params['license'] = "Public"
      request.params['imageType'] = "Photo"
      request.params['safeSearch'] = "Strict"
      request.params['q'] = term
    end

    JSON.parse(response.body, symbolize_names: true)[:value][0]
  end

  private

  def self.conn
    Faraday.new(url: 'https://api.bing.microsoft.com') do |base|
      base.headers['Ocp-Apim-Subscription-Key'] = ENV['BING_API_KEY']
    end
  end
end
