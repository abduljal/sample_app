class RecipesController < ApplicationController

	before_filter :find_recipe, :only => [:show, :edit, :update, :edit_Homepage, :destroy]
	before_filter :find_recipe_ingredients_n_steps_n_descs, :only => [:show,:edit_Homepage]
	
  def new
  @recipe = Recipe.new(:blog => 'Make it to test it :)')
  end
  
  def index
    @recipes = Recipe.all
  end
  
  def show
  end
  
  def edit_Homepage
  end
  
  def edit
  end
  
  def update
	@recipe.update_attributes(recipe_params)
	if @recipe.save
      flash[:success] = "Yay! edited - "+@recipe.name
	 
      redirect_to @recipe
    else
      render 'new'
    end
  end
  
  def destroy
	if @recipe.destroy
	flash[:success] = "Yay! a dish has been deleted"
      redirect_to index_recipes_path
    else
       redirect_to @recipe
    end
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:success] = "Yay! a new dish - "+@recipe.name
	 
      redirect_to add_description_path(:id => @recipe.id)
    else
      render 'new'
    end
  end

  private

    def recipe_params
      params.require(:recipe).permit(:name,:serves,:blog)
    end 
	def find_recipe
      @recipe = Recipe.find(params[:id])
    end
	def find_recipe_ingredients_n_steps_n_descs
      @ingredients = Recipe.find(params[:id]).ingredients
	  @steps=Recipe.find(params[:id]).steps
	  @descriptions=Recipe.find(params[:id]).descriptions
    end
end
