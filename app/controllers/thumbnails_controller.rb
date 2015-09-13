class ThumbnailsController < ApplicationController
  # Turn off CSRF protection to avoid auth error only on the following method.
  #TODO: Need auth for API use. Until then, I disable the CSRF protection.
  protect_from_forgery except: :create

  def create
    thumb = Thumbnail.create(
      url_prefix:  params["url_prefix"],
      image:       [params["image"]],
    )

    thumb.save

    render :nothing => true
  end

  def get_image
    @thumbs = Thumbnail.only(:image).find(params[:id])
    send_data(@thumbs.image.data, :disposition => 'inline', :type => "image/gif")
  end
end
