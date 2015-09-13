class AdultsController < ApplicationController
  # Turn off CSRF protection to avoid auth error only on the following method.
  #TODO: Need auth for API use. Until then, I disable the CSRF protection.
  protect_from_forgery except: :create

  def index
    @urls = Url.all.page params[:page]
    @tags = Tag.all
    @selected_url_tags = UrlTag.all
    @thumbs = Thumbnail.without(:image).all
  end
end
