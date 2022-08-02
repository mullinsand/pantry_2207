class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    @recipes.reduce([]) do |all_ingredients, recipe|
      all_ingredients + recipe.ingredients.map(&:name)
    end.uniq
  end

  def highest_calorie_meal
    @recipes.max_by(&:total_calories)
  end
end
