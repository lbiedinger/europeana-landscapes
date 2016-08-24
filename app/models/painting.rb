require 'cgi'
require 'open-uri'
require 'json'

class Painting < ActiveRecord::Base
  def europeana_record
    url = "http://www.europeana.eu/api/v2/record/#{self.europeana_id}.json?wskey=#{ENV["EUROPEANA_API_KEY"]}"
    JSON.load(open(url))["object"]
  end

  def thumbnail_url
    media_uri = europeana_record["aggregations"].first["edmIsShownBy"]
    thumbnail_url ||= "https://www.europeana.eu/api/v2/thumbnail-by-url.json?size=w200&uri=#{CGI.escape media_uri}&type=IMAGE"
    thumbnail_url ||= "https://www.europeana.eu/api/v2/thumbnail-by-url.json?size=w200&type=IMAGE"
  end
end