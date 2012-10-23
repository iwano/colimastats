class LocationsController < ApplicationController
  # GET /locations
  # GET /locations.json
  def getcities
    @cities = City.where(:state_id=>params[:id]) unless params[:id].blank?
    render :partial => "cities", :locals => { :cities => @cities}
  end

  def getlocalities
    @localities = Locality.where(:city_id=>params[:id]) unless params[:id].blank?
    render :partial => "localities", :locals => { :localities => @localities}
  end

  def index
    @locations = Location.all
    @location = Location.new
    @states = State.all
    @json = Location.all.to_gmaps4rails

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @locations }
    end
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    @location = Location.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @location }
    end
  end

  # GET /locations/new
  # GET /locations/new.json
  def new
    @location = Location.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @location }
    end
  end

  # GET /locations/1/edit
  def edit
    @location = Location.find(params[:id])
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(params[:location])
    if params[:location][:name] == nil
      state = State.find(params[:location][:state_id])
      city = City.find(params[:location][:city_id])
      locality = Locality.find(params[:location][:locality_id])
      address = "#{locality.name}, #{city.name} - #{state.name}"
      @location.name = locality.name
      @location.address = address
    end

    respond_to do |format|
      if @location.save
        format.json { render json: @location, status: :created, location: @location }
      else
        format.html { render action: "new" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /locations/1
  # PUT /locations/1.json
  def update
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to locations_url }
      format.json { head :no_content }
    end
  end
end
