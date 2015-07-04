class AdultsController < ApplicationController
  # Turn off CSRF protection to avoid auth error only on the following method.
  #TODO: Need auth for API use. Until then, I disable the CSRF protection.
  protect_from_forgery except: :create

  def index
    @urls = Url.all.page params[:page]
    @thumbs = Thumbnail.without(:image).all
  end

  def create
    url = Url.create(
      site_name:    params["Sitename"],
      origin_url:   params["OriginUrl"],
      movie_pics:   params["moviePics"],
      title:        params["title"],
      time:         params["time"],
      player_url:   params["playerurl"],
      emb_url:      params["emburl"],
      rate:         params["rate:"],
      rating_count: params["ratingcount"].to_i,
      rate_HTML:    params["ratehtml"],
      mosaic:       params["mosaicflg"] === "0" ? false : true
    )

    params["tags"].each do |t|
      tag = Tag.find_or_create_by(
        tag_name: t
      )
      url_tag = UrlTag.create(
        url_id: url["_id"],
        tag_id: tag["_id"]
      )
    end

    render :nothing => true
  end
end
