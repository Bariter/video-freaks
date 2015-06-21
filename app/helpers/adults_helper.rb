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

  def show_movie_tags(tag_arys)
    tags = "";

    return "none" if tag_arys.empty?

    tag_arys.each do |tag|
      tags << tag
      tags << ", "
    end

    return tags.chop!;
  end
end
