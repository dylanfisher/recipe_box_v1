module RecipesHelper

  def recipe_user(recipe)
    "<span class='color--user'>#{recipe.user.first_name}</span>".html_safe
  end

  def recipe_adjectives(recipe)
    adjectives = recipe.adjectives
    text = adjectives.collect { |a| "<span class='color--edited'>#{a.text}</span>" }
    text.to_sentence.html_safe
  end

  def recipe_good_for(recipe)
    "It is good for #{recipe_adjectives(recipe)}.".html_safe if recipe.adjectives.any?
  end

end
