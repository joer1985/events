class PointsController < ApplicationController
  def index
    @points = Point.all
  end

  def show
    @points = Point.find(params[:id])
  end



private

def point_params
  params.require(:point).permit(:title, :city, :state, :country, :zip, :thumb, :purchase_link, :description, :category)
end
end
