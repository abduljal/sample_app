class IngredientsController < ApplicationController
  def new
	@recipe = Recipe.find(params[:id])
	@ingredient=Ingredient.new

  end
  
  def create
    @ingredient = Ingredient.new(ingredient_params)
	
    if @ingredient.save
      flash[:success] = "Yay! a new ingredient for the dish - "+@ingredient.name
      redirect_to add_ingredient_path(:id => @ingredient.recipe_id)
    else
       render add_ingredient_path(:id => @recipe.id)
    end
  end
  
   private

    def ingredient_params
      params.require(:ingredient).permit(:name,:amount,:recipe_id)
    end
end
