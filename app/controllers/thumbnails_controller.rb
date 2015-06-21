class ThumbnailsController < ApplicationController
  def get_image
    @thumbs = Thumbnail.only(:image).find(params[:id])
    send_data(@thumbs.image.data, :disposition => 'inline', :type => "image/gif")
  end
end
