class StatsController < ApplicationController
def show
  if params[:id] != nil
    @stat = Stat.find_by_locality_id(params[:id])
    @marker = Location.find_by_locality_id(params[:id])
  else
    locality = Locality.find_by_name(params[:name])
    @stat = Stat.find_by_locality_id(locality.id)
    @marker = Location.find_by_name(params[:name])
  end
  respond_to do |format|  
    format.js 
  end
end
end