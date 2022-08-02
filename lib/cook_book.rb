class CookBook
  attr_reader :recipes,
              :date

  def initialize
    @recipes = []
    @date = Time.new.strftime("%m-%d-%y")
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

  def summary
    @recipes.map do |recipe|
      recipe.get_recipe_summary
    end
  end
end
