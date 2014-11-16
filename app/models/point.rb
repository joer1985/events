class Point < ActiveRecord::Base
before_action :feed_retrieval

require 'open-uri'



:save_latlong
private

def save_latlong
  results = Geocoder.coordinates("point.zip")
  self.latitude = results.first
  self.longitude = results.last
end

def feed_retrieval
  url = "http://sesamestreetlive.com/tickets-0/app-rss"
  @parsed_response = Nokogiri::HTML(open(url))
  @points = @parsed_response.each do |f|
  {title: @parsed_response.xpath("//title"), city: @parsed_response.xpath("//link"), state: @parsed_response.xpath("//author"), country: @parsed_response.xpath("//creator"), zip: @parsed_response.xpath("//category"), thumb: @parsed_response.xpath("//description"), purchase_link: @parsed_response.xpath("//guid"), description: @parsed_response.xpath("//pubdate")}  
end








##def feed_retrieval
##  @points = @parsed_response.each do |f|
##  {title: @parsed_response.xpath("//title"), city: @parsed_response.xpath("//link"), state: @parsed_response.xpath("//author"), country: @parsed_response.xpath("//creator"), zip: @parsed_response.xpath("//category"), thumb: @parsed_response.xpath("//description"), purchase_link: @parsed_response.xpath("//guid"), description: @parsed_response.xpath("//pubdate")}  
##end



##Geocoder.coordinates("address")
end
end

##



