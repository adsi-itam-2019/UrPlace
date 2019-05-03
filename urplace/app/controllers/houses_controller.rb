class HousesController < ApplicationController
  before_action :set_house, only: [:show, :edit, :update, :destroy]

  # GET /houses
  # GET /houses.json
  def index

    
    @houses = House.all

    load_routers(@houses)
    
    
  end

  def load_routers(houses)  
   @routers_default = Gmaps4rails.build_markers(houses) do |plot, marker|  
      marker.lat plot.lat 
      marker.lng plot.lon  

      @status = rand(1..4)  
      @battery = rand(10..90)  
      @ip = "192.168."+rand(0..255).to_s+"."+rand(15..250).to_s  
      @connected = rand(50..100)  

      if @status == 1  
        url_alert = "good.png"  
        @status == "Normal"  
      else  
        url_alert = "alert.png"  
      end  

      marker.picture({  
          
        "width" => 35,  
        "height" => 30  
      })  

      marker.infowindow render_to_string(:partial => "/houses/info",   
        :locals => {:name => plot.name, :house => plot })  
   end  
 end


  # GET /houses/1
  # GET /houses/1.json
  def show
  end

  # GET /houses/new
  def new



    @house = House.new
  end

  # GET /houses/1/edit
  def edit
  end

  # POST /houses
  # POST /houses.json
  def create
    @house = House.new(house_params)

    respond_to do |format|
      if @house.save
        format.html { redirect_to @house, notice: 'House was successfully created.' }
        format.json { render :show, status: :created, location: @house }
      else
        format.html { render :new }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /houses/1
  # PATCH/PUT /houses/1.json
  def update
    respond_to do |format|
      if @house.update(house_params)
        format.html { redirect_to @house, notice: 'House was successfully updated.' }
        format.json { render :show, status: :ok, location: @house }
      else
        format.html { render :edit }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /houses/1
  # DELETE /houses/1.json
  def destroy
    @house.destroy
    respond_to do |format|
      format.html { redirect_to houses_url, notice: 'House was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house
      @house = House.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def house_params
      params.require(:house).permit(:name, :address, :postal, :description, :lat, :lon, :rating, :price)
    end
end
