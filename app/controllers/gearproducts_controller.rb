class GearproductsController < ApplicationController
  before_action :set_gearproduct, only: [:show, :edit, :update, :destroy]

  # GET /gearproducts
  # GET /gearproducts.json
  def index
    @gearproducts = Gearproduct.all
  end

  # GET /gearproducts/1
  # GET /gearproducts/1.json
  def show
  end

  # GET /gearproducts/new
  def new
    @gearproduct = Gearproduct.new
  end

  # GET /gearproducts/1/edit
  def edit
  end

  # POST /gearproducts
  # POST /gearproducts.json
  def create
    @gearproduct = Gearproduct.new(gearproduct_params)

    respond_to do |format|
      if @gearproduct.save
        format.html { redirect_to @gearproduct, notice: 'Gearproduct was successfully created.' }
        format.json { render :show, status: :created, location: @gearproduct }
      else
        format.html { render :new }
        format.json { render json: @gearproduct.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gearproducts/1
  # PATCH/PUT /gearproducts/1.json
  def update
    respond_to do |format|
      if @gearproduct.update(gearproduct_params)
        format.html { redirect_to @gearproduct, notice: 'Gearproduct was successfully updated.' }
        format.json { render :show, status: :ok, location: @gearproduct }
      else
        format.html { render :edit }
        format.json { render json: @gearproduct.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gearproducts/1
  # DELETE /gearproducts/1.json
  def destroy
    @gearproduct.destroy
    respond_to do |format|
      format.html { redirect_to gearproducts_url, notice: 'Gearproduct was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gearproduct
      @gearproduct = Gearproduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gearproduct_params
      params.require(:gearproduct).permit(:name, :description, :image_url, :gear_type)
    end
end
