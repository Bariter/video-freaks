class UrlTag
  include Mongoid::Document
  field :url_id, type: String
  field :tag_id, type: String

  def find_title
    url = Url.find(self.url_id)
    url.title unless url.nil?
  end

  def self.find_tags(url)
    tags_ids = where(:url_id => url._id).to_ary

    tags = []
    tags_ids.each do |tags_id|
      tags << Tag.find(tags_id.tag_id).tag_name
    end

    return tags
  end
end
