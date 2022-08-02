require './lib/ingredient'
require './lib/pantry'

describe Pantry do
  it 'exists and has attributes' do
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})

    pantry = Pantry.new

    expect(pantry).to be_instance_of(Pantry)
    expect(pantry.stock).to eq({})
  end

  it '#stock_check and #restock' do
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
    pantry = Pantry.new

    expect(pantry.stock_check(ingredient1)).to eq(0)
    pantry.restock(ingredient1, 5)
    pantry.restock(ingredient1, 10)
    expect(pantry.stock_check(ingredient1)).to eq(15)
    pantry.restock(ingredient2, 7)
    expect(pantry.stock_check(ingredient2)).to eq(7)
  end

  it '#enough_ingredients_for?' do
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})

    recipe1 = Recipe.new("Mac and Cheese")
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)

    pantry = Pantry.new
    pantry.restock(ingredient1, 5)
    pantry.restock(ingredient1, 10)
    expect(pantry.enough_ingredients_for?(recipe1)).to eq(false)
    pantry.restock(ingredient2, 7)
    expect(pantry.enough_ingredients_for?(recipe1)).to eq(false)
    pantry.restock(ingredient2, 1)
    expect(pantry.enough_ingredients_for?(recipe1)).to eq(true)
  end

end