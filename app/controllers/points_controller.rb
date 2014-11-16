class PointsController < ApplicationController
  def index
    @points = Point.all
  end

  def show
    @point = Point.find(params[:id])
    @url = iframe_url
  end

  private

  def iframe_url
    "https://www.google.com/maps/embed/v1/place?key=#{ENV["GOOGLE_MAPS_API_KEY"]}&q=#{@point.latitude},#{@point.longitude}"
  end
end
