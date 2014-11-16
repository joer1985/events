class Point < ActiveRecord::Base
  geocoded_by :zip
  after_validation :geocode

end

##



