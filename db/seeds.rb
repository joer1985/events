# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ActiveRecord::Base.transaction do

test = Point.create(
  title: 'Test Show',
  city: 'New York',
  state: 'New York',
  country: 'United States of America',
  zip: '10010',
  thumb: 'http://www.sesamestreet.org/cms_services/services?action=download&uid=092e125c-c270-41c8-9d7a-c192ff757878',
  purchase_link: 'http://sesamestreetlive.com/springfield-mo-0',
  description: 'This is a test point.',
  category: 'Event',)

puts 'Seed data added.'
end