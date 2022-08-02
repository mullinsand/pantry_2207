require './lib/ingredient'

describe Ingredient do
  it 'exists and has attributes' do
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})

    expect(ingredient1).to be_instance_of(Ingredient)
    expect(ingredient1.name).to eq("Cheese")
    expect(ingredient1.unit).to eq("oz")
    expect(ingredient1.calories).to eq(50)
  end
end