class Url
  include Mongoid::Document
  field :site_name, type: String
  field :origin_url, type: String
  field :movie_pics, type: Array
  field :title, type: String
  field :time, type: String
  field :tags, type: Array
  field :player_url, type: String
  field :emb_url, type: String
  field :rate, type: String
  field :rating_count, type: Integer
  field :rate_HTML, type: String
  field :mosaic, type: Boolean 
end
