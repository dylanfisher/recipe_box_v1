module RecipesHelper

  def recipe_user(recipe)
    link_to user_color(recipe.user), recipe_user_path(@recipe.user.slug)
  end

  def recipe_adjectives(recipe)
    adjectives = recipe.adjectives
    text = adjectives.collect { |a| "<span class='color--edited'>#{a.text}</span>" }
    text.to_sentence.html_safe
  end

  def recipe_good_for(recipe)
    "It is good for #{recipe_adjectives(recipe)}.".html_safe if recipe.adjectives.any?
  end

  def current_displayed_recipe_sort
    if params[:user]
      user = User.friendly.find(params[:user])
      "recipes by #{user_color(user)}".html_safe
    else
      "everything"
    end
  end

end
