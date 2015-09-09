class Admin::MealTypesController < ApplicationController
  before_action :set_meal_type, only: [:show, :edit, :update, :destroy]

  # GET /admin/meal_types
  # GET /admin/meal_types.json
  def index
    @meal_types = MealType.all
  end

  # GET /admin/meal_types/1
  # GET /admin/meal_types/1.json
  def show
  end

  # GET /admin/meal_types/new
  def new
    @meal_type = MealType.new
  end

  # GET /admin/meal_types/1/edit
  def edit
  end

  # POST /admin/meal_types
  # POST /admin/meal_types.json
  def create
    @meal_type = MealType.new(meal_type_params)

    respond_to do |format|
      if @meal_type.save
        format.html { redirect_to [:admin, @meal_type], notice: 'Meal type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @meal_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @meal_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/meal_types/1
  # PATCH/PUT /admin/meal_types/1.json
  def update
    respond_to do |format|
      if @meal_type.update(meal_type_params)
        format.html { redirect_to [:admin, @meal_type], notice: 'Meal type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @meal_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/meal_types/1
  # DELETE /admin/meal_types/1.json
  def destroy
    @meal_type.destroy
    respond_to do |format|
      format.html { redirect_to admin_meal_types_url, notice: 'Meal type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal_type
      @meal_type = MealType.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meal_type_params
      params.require(:meal_type).permit(:name)
    end
end
