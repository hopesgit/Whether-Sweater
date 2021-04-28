class ImageSerializer
  include FastJsonapi::ObjectSerializer
  set_id nil
  attributes :name, :image_url, :creative_commons_license, :microsoft_privacy_statement
end
