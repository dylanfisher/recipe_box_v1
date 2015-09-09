class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    @recipes = MealType.friendly.find(params[:meal_type]).recipes if params[:meal_type]
  end

  def show
    @recipe = Recipe.friendly.find(params[:id])
  end
end
