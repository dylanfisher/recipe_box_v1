class RecipePolicy < ApplicationPolicy

  def index?
    user?
  end

end
