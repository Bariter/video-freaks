class Thumbnail
  include Mongoid::Document
  field :url_prefix, type: String
  field :image, type: BSON::Binary

  def match(url)
    prefix = self.url_prefix
    return false if prefix.nil? || prefix.empty?

    reg = Regexp.new(prefix)
    return reg =~ url ? true : false
  end
end
