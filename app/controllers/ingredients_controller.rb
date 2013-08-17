class IngredientsController < ApplicationController
  def new
	require 'logger'
	  log = Logger.new('Ilog.txt')
	  log.debug "Recipe id : "+params[:id].to_s
	@recipe = Recipe.find(params[:id])
	@ingredient=Ingredient.new(:recipe => @recipe)
  end
  
  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
		require 'logger'
	  log = Logger.new('Ilog.txt')
	  log.debug "End Recipe id : "+@ingredient.recipe_id.to_s
      flash[:success] = "Yay! a new ingredient for the dish "+@ingredient.name
      redirect_to add_ingredient_path(:id => @ingredient.recipe_id)
    else
       redirect_to add_ingredient_path(:id => @ingredient.recipe_id)
    end
  end
  
   private

    def ingredient_params
      params.require(:ingredient).permit(:name,:amount,:recipe_id)
    end
end
