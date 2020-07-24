class IngredientsController < ApplicationController
  def show
    @chef = Chef.find(params[:chef_id])
    @ingredients = @chef.dishes.map { |dish| dish.ingredients }.flatten
  end
end
