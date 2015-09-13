class Admin::RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /admin/recipes
  # GET /admin/recipes.json
  def index
    @recipes = policy_scope(Recipe).page(params[:page])
    authorize @recipes
  end

  # GET /admin/recipes/1
  # GET /admin/recipes/1.json
  def show
    authorize @recipe
  end

  # GET /admin/recipes/new
  def new
    @recipe = Recipe.new
    authorize @recipe
  end

  # GET /admin/recipes/1/edit
  def edit
  end

  # POST /admin/recipes
  # POST /admin/recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    authorize @recipe

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to [:admin, @recipe], notice: 'Recipe was successfully created.' }
        format.json { render action: 'show', status: :created, location: @recipe }
      else
        format.html { render action: 'new' }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/recipes/1
  # PATCH/PUT /admin/recipes/1.json
  def update
    authorize @recipe
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to [:admin, @recipe], notice: 'Recipe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/recipes/1
  # DELETE /admin/recipes/1.json
  def destroy
    authorize @recipe
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to admin_recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:title, :description, :ingredients, :method, :meal_type_id, :caption, :user_id,
        adjectives_attributes: [:id, :text, :_destroy],
        ingredients_attributes: [:id, :quantity, :item, :_destroy])
    end
end
