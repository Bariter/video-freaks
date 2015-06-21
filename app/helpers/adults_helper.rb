module AdultsHelper
  def image_id(url, thumbnails)
    thumbnails.each do |thumb|
      return thumb.id if thumb.match(url)
    end
  end
end
