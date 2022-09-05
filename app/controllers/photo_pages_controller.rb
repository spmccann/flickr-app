class PhotoPagesController < ApplicationController
  def index
    return unless search_params[:query]

    flickr = Flickr.new Figaro.env.api_key, Figaro.env.api_secret
    @list = flickr.people.getPublicPhotos(user_id: search_params[:query])

    # @echo = flickr.test.echo
  end

  def search; end

  private

  def search_params
    params.permit(:query, :commit)
  end
end
