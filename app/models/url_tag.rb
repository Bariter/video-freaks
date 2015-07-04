class UrlTag
  include Mongoid::Document
  field :url_id, type: String
  field :tag_id, type: String

  def find_title
    url = Url.find(self.url_id)
    url.title unless url.nil?
  end
end
