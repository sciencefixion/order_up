require "rails_helper"

# As a visitor
# When I visit a chef's show page
# I see the name of that chef
# And I see a link to view a list of all ingredients that this chef uses in their dishes
# When I click on that link
# I'm taken to a chef's ingredient index page
# and I can see a unique list of names of all the ingredients that this chef uses

RSpec.describe "Chef show page" do
  it "shows the chef name and a link to view all ingredients in their dishes" do
    chef = Chef.create(name: "Pierre Escargots")
    dish = chef.dishes.create(name: "Windy City Dog", description: "Make me one with everything!")
    bun = Ingredient.create(name: "bun", calories: 100)
    dog = Ingredient.create(name: "kosher hot dog", calories: 150)

    DishIngredient.create(dish: dish, ingredient: bun)
    DishIngredient.create(dish: dish, ingredient: dog)

    visit "/chefs/#{chef.id}"

    expect(page).to have_content(chef.name)
    expect(page).to have_link("All Ingredients")

    click_on "All Ingredients"

    expect(current_path).to eq("/chefs/#{chef.id}/ingredients")


    expect(page).to have_content("bun")
    expect(page).to have_content("kosher hot dog")
  end
end
