class Image
  attr_reader :id, :name, :image_url, :creative_commons_license, :microsoft_privacy_statement

  def initialize(image_data)
    @id = nil
    @name = image_data[:name]
    @image_url = image_data[:contentUrl]
    @creative_commons_license = image_data[:creativeCommons]
    @microsoft_privacy_statement = "https://go.microsoft.com/fwlink/?LinkId=521839"
  end
end
