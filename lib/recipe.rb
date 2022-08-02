class Recipe
  attr_reader :name,
              :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = Hash.new(0)
  end

  def add_ingredient(ingredient, quantity)
    @ingredients_required[ingredient] += quantity
  end

  def ingredients
    @ingredients_required.keys
  end

  def total_calories
    @ingredients_required.reduce(0) do |total, (ingredient, quantity)|
      total + (ingredient.calories * quantity)
    end
  end

  def get_recipe_summary
    recipe_details = Hash.new
    recipe_details[:name] = name
    recipe_details[:details] = get_recipe_details
    recipe_details
  end
  
  def get_recipe_details
    recipe_details = Hash.new
    recipe_details[:ingredients] = get_ingredient_details
    recipe_details[:total_calories] = total_calories
    recipe_details
  end

  def get_ingredient_details
    sorted_ingredients = ingredients.sort_by do |ingredient| 
      -ingredient.calories * @ingredients_required[ingredient]
    end
    sorted_ingredients.map do |ingredient|
      ingredient_details = Hash.new
      ingredient_details[:ingredient] = ingredient.name
      ingredient_details[:amount] = "#{@ingredients_required[ingredient]} #{ingredient.unit}"
      ingredient_details
    end
  end
end
