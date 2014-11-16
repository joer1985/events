# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#ActiveRecord::Base

#  Point.create(
#  title: 'Test Show',
#  city: 'New York',
#  state: 'New York',
#  country: 'United States of America',
#  zip: '10010',
#  thumb: 'http://www.sesamestreet.org/cms_services/services?action=download&uid=092e125c-c270-41c8-9d7a-c192ff757878',
#  purchase_link: 'http://sesamestreetlive.com/springfield-mo-0',
#  description: 'This is a test point.',
#  category: 'Event',)

#puts 'Seed data added.'
#end

endpoint = 'http://sesamestreetlive.com/tickets-0/app-rss'
response = RestClient.get(endpoint)
document = Nokogiri.parse(response)
points = document.xpath('//item')

points.each do |point|
  title = point.xpath("title").first.try(:text)
  city = point.xpath("link").first.try(:text)
  state = point.xpath("author").first.try(:text)
  country = point.xpath("creator").first.try(:text)
  zip = point.xpath("category").first.try(:text)
  thumbnail = point.xpath("description").first.try(:text)
  purchase_link = point.xpath("guid").first.try(:text)
  description = point.xpath("pubdate").first.try(:text)


  point = Point.find_or_initialize_by(purchase_link: purchase_link) do |p|
    p.title = title
    p.city = city
    p.state = state
    p.country = country
    p.zip = zip
    p.thumb = thumbnail
    p.description = description
    p.category = 'event'
	end

  if point.persisted?
    puts "Already exists: #{point.purchase_link}"
  else
    point.save
    puts "Added: #{point.purchase_link}"
    sleep 0.5
  end
end



# require 'open-uri'
# point = Nokogiri::HTML(open("http://sesamestreetlive.com/tickets-0/app-rss")).map do |point|







