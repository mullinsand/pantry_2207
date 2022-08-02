require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'
require './lib/cook_book'

describe CookBook do
  it 'exists and has attributes' do
    cookbook = CookBook.new

    expect(cookbook).to be_instance_of(CookBook)
    expect(cookbook.recipes).to eq([])
    expect(cookbook.date).to eq(Time.new.strftime("%m-%d-%y"))
  end

  it '#add_recipe' do
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})

    recipe1 = Recipe.new("Mac and Cheese")
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient1, 4)
    recipe1.add_ingredient(ingredient2, 8)
    recipe2 = Recipe.new("Cheese Burger")
    cookbook = CookBook.new
    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)
    expect(cookbook.recipes).to eq([recipe1, recipe2])
  end

  it '#ingredients' do
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})

    recipe1 = Recipe.new("Mac and Cheese")
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)

    ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    recipe2 = Recipe.new("Cheese Burger")
    recipe2.add_ingredient(ingredient1, 2)
    recipe2.add_ingredient(ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 1)

    cookbook = CookBook.new
    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)

    expect(cookbook.ingredients).to eq(["Cheese", "Macaroni", "Ground Beef", "Bun"])
  end

  it '#highest_calorie_meal' do
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})

    recipe1 = Recipe.new("Mac and Cheese")
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)

    ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    recipe2 = Recipe.new("Cheese Burger")
    recipe2.add_ingredient(ingredient1, 2)
    recipe2.add_ingredient(ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 1)

    cookbook = CookBook.new
    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)
    expect(cookbook.highest_calorie_meal).to eq(recipe2)
  end

  it '#summary' do
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})

    recipe1 = Recipe.new("Mac and Cheese")
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)

    ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 1})
    recipe2 = Recipe.new("Burger")
    recipe2.add_ingredient(ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 100)

    cookbook = CookBook.new
    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)
    expect(cookbook.summary).to eq(
      [{:name=>"Mac and Cheese", 
        :details=>{:ingredients=>[{:ingredient=>"Macaroni", :amount=>"8 oz"}, 
                                  {:ingredient=>"Cheese", :amount=>"2 C"}], 
                    :total_calories=>440}}, 
        {:name=>"Burger", 
        :details=>{:ingredients=>[{:ingredient=>"Ground Beef", :amount=>"4 oz"}, 
                                  {:ingredient=>"Bun", :amount=>"100 g"}], 
                    :total_calories=>500}}])
  end
end