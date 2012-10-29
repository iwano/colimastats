class LocationsController < ApplicationController
  # GET /locations
  # GET /locations.json
  def graphs
    gon.cities = get_cities_total_pob_numbers
    # gon.localities = get_localities_total_pob_numbers
  end

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
    @location = Location.find_by_name(params[:name])

    respond_to do |format|
      format.js
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
    l = Location.find_by_locality_id(params[:location][:locality_id])
    if !l.blank?
      @location = l
      @location[:exist] = true
    else
      @location = Location.new(params[:location])
      if params[:location][:name] == nil
        state = State.find(params[:location][:state_id])
        city = City.find(params[:location][:city_id])
        locality = Locality.find(params[:location][:locality_id])
        address = "#{locality.name}, #{city.name} - #{state.name}"
        @location.name = locality.name
        @location.address = address
        @location[:exist] = false
      end
      @location.save
    end

    respond_to do |format|
      format.json { render json: @location, status: :created, location: @location }
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
      format.js
    end
  end

    private

      def get_cities_total_pob_numbers
        c = [4, 98, 286, 386, 457, 525, 574, 525, 574, 753, 796, 1177, 1]
        [{name:'Armeria', total:28695, m:14456, f:14239}, {name:'Colima', total:146904, m:71556, f:75348}, 
          {name:'Comala', total:20888, m:10543, f:10345}, {name:'Coquimatlan', total:19385, m:9709, f:9676}, 
          {name:'Cuauhtemoc', total:27107, m:13483, f:13624}, {name:'Ixtlahuacan', total:5300, m:2679, f:2621}, 
          {name:'Manzanillo', total:161420, m:81007, f:80413}, {name:'Minatitlan', total:8174, m:4196, f:3978}, 
          {name:'Tecoman', total:112726, m:56804, f:55922}, {name:'Villa de Alvarez', total:119956, m:58357, f:61599}]
      end

      def get_localities_total_pob_numbers
        l_array =[]
        cities = City.all
        cities.each do |city|
          localities = city.localities
          localities.each do |locality|

          end
          stat = Locality.find_by_locality_id_an_city_id
          city_hash[:name]=city.name
          city_hash[:total]=city.total #error
          city_hash[:m]=city.m 
          city_hash[:f]=city.f 
        end
        
      end
end
