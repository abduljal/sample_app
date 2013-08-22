class IngredientsController < ApplicationController
  
  before_filter :find_recipe, :only => [:new, :edit_add]
  before_filter :find_ingredient, :only => [:edit, :update, :destroy]
  
  def new
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
  
  def edit_add
	@ingredient=Ingredient.new
	@current_ingredients=@recipe.ingredients
  end
  
  def create_edit
    @ingredient = Ingredient.new(ingredient_params)
	recipe=Recipe.find(@ingredient.recipe_id)
    if @ingredient.save
      flash[:success] = "Yay! a new ingredient for the dish in edit- "+@ingredient.name
      redirect_to edit_recipe_home_path+"/"+recipe.id.to_s
    else
       render recipe
    end
  end
  
  def edit
	@recipe=Recipe.find(@ingredient.recipe_id)
  end
  
  def update
	@ingredient.update_attributes(ingredient_params)
	recipe=Recipe.find(@ingredient.recipe_id)
	if @ingredient.save
      flash[:success] = "Yay! edited - "+@ingredient.name
	 
       redirect_to edit_recipe_home_path+"/"+recipe.id.to_s
    else
      redirect_to recipe
    end
  end
  
  def destroy
	recipe=Recipe.find(@ingredient.recipe_id)
	if @ingredient.destroy
	flash[:success] = "Yay! an ingredient deleted for the dish - "+recipe.name
      redirect_to edit_recipe_home_path+"/"+recipe.id.to_s
    else
       redirect_to recipe
    end
  end
  
   private

    def ingredient_params
      params.require(:ingredient).permit(:name,:amount,:recipe_id)
    end
	def find_recipe
      @recipe = Recipe.find(params[:id])
    end
	def find_ingredient
      @ingredient=Ingredient.find(params[:id])
    end
end
