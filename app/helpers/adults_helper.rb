module AdultsHelper
  def image_id(url, thumbnails)
    thumbnails.each do |thumb|
      return thumb.id if thumb.match(url)
    end
  end

  def percentage(str)
    return (str.to_i).to_s + "%"
  end

  def reverse_percentage(str)
    return (100 - str.to_i).to_s + "%"
  end

  def show_movie_tags(url)
    tags = []

    tags_ary = @selected_url_tags.find_tags(url)

    return 'none' if tags_ary.empty?
    tags_ary.each do |tag|
      tags << tag
    end

    return tags * ", ";
  end
end
