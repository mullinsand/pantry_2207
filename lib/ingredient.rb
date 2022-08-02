class Ingredient
  attr_reader :name,
              :unit,
              :calories
  def initialize(ingredient_data)
    @name = ingredient_data[:name]
    @unit = ingredient_data[:unit]
    @calories = ingredient_data[:calories]
  end
end
