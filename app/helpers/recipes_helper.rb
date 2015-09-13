module RecipesHelper

  def recipe_user(recipe)
    "<span class='color--user'>#{recipe.user.first_name}</span>".html_safe
  end

end
