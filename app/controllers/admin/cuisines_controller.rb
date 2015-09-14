class Admin::CuisinesController < ApplicationController
  before_action :set_cuisine, only: [:show, :edit, :update, :destroy]

  # GET /admin/cuisines
  # GET /admin/cuisines.json
  def index
    @cuisines = Cuisine.all
  end

  # GET /admin/cuisines/1
  # GET /admin/cuisines/1.json
  def show
  end

  # GET /admin/cuisines/new
  def new
    @cuisine = Cuisine.new
  end

  # GET /admin/cuisines/1/edit
  def edit
  end

  # POST /admin/cuisines
  # POST /admin/cuisines.json
  def create
    @cuisine = Cuisine.new(cuisine_params)

    respond_to do |format|
      if @cuisine.save
        format.html { redirect_to [:admin, @cuisine], notice: 'Cuisine was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cuisine }
      else
        format.html { render action: 'new' }
        format.json { render json: @cuisine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/cuisines/1
  # PATCH/PUT /admin/cuisines/1.json
  def update
    respond_to do |format|
      if @cuisine.update(cuisine_params)
        format.html { redirect_to [:admin, @cuisine], notice: 'Cuisine was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cuisine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/cuisines/1
  # DELETE /admin/cuisines/1.json
  def destroy
    @cuisine.destroy
    respond_to do |format|
      format.html { redirect_to admin_cuisines_url, notice: 'Cuisine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cuisine
      @cuisine = Cuisine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cuisine_params
      params.require(:cuisine).permit(:name)
    end
end
