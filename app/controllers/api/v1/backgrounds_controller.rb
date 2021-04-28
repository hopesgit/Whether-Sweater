class Api::V1::BackgroundsController < ApplicationController
  def show
    image_search = ImageSearchService.fetch_image_from_search_term(params[:location])
    image = Image.new(image_search)
    render json: ImageSerializer.new(image).serialized_json
  end
end
