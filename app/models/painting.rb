require 'cgi'
require 'open-uri'
require 'json'

class Painting < ActiveRecord::Base
  before_save :set_thumbnail_url
  def europeana_record
    url = "http://www.europeana.eu/api/v2/record/#{self.europeana_id}.json?wskey=#{ENV["EUROPEANA_API_KEY"]}"
    JSON.load(open(url))["object"]
  end

  def set_thumbnail_url
    if thumbnail_url.blank?
      media_uri = europeana_record["aggregations"].first["edmIsShownBy"]
      self.thumbnail_url = "https://www.europeana.eu/api/v2/thumbnail-by-url.json?size=w200&uri=#{CGI.escape media_uri}&type=IMAGE"
    end
  end
end