require "rails_helper"

# As a visitor
# When I visit a dish's show page
# I see a list of ingredients for that dish
# and the chef's name
RSpec.describe "Dish show page" do
  it "shows a list of ingredients for the dish and chef's name" do
    chef = Chef.create(name: "Pierre Escargots")
    dish = chef.dishes.create(name: "Windy City Dog", description: "Make me one with everything!")
    bun = Ingredient.create(name: "bun", calories: 100)
    dog = Ingredient.create(name: "kosher hot dog", calories: 150)

    DishIngredient.create(dish: dish, ingredient: bun)
    DishIngredient.create(dish: dish, ingredient: dog)

    visit "/dishes/#{dish.id}"

    expect(page).to have_content(dish.name)
    expect(page).to have_content("bun")
    expect(page).to have_content("kosher hot dog")
    expect(page).to have_content(chef.name)

  end
end
