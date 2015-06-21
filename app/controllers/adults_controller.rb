class AdultsController < ApplicationController
  def index
    @urls = Url.all.page params[:page]
    @thumbs = Thumbnail.without(:image).all
  end
end
