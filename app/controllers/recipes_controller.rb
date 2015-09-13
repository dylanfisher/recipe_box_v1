class RecipesController < ApplicationController
  def index
    # binding.pry
    @recipes = Recipe.recent.all
    if (params[:order] == 'asc')
      @recipes = Recipe.by_title.all
    elsif (params[:order] == 'desc')
      @recipes = Recipe.by_title_desc.all
    elsif (params[:user])
      @recipes = Recipe.joins(:user).where(users: {slug: params[:user]}).all
    end
  end

  def show
    @recipe = Recipe.friendly.find(params[:id])
  end
end
