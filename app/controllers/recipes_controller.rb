class RecipesController < ApplicationController

	before_filter :find_recipe, :only => [:show, :edit, :update, :edit_Homepage, :destroy]
	before_filter :find_recipe_ingredients, :only => [:show,:edit_Homepage]
	
  def new
  @recipe = Recipe.new
  end
  
  def index
    @recipes = Recipe.all
  end
  
  def show
	@steps=@recipe.steps
	@descriptions=@recipe.descriptions
  end
  
  def editHomepage
  end
  
  def edit
  end
  
  def update
	@recipe.update_attributes(recipe_params)
	if @recipe.save
      flash[:success] = "Yay! edited - "+@recipe.name
	 
      redirect_to add_description_path(:id => @recipe.id)
    else
      render 'new'
    end
  end
  
  def destroy
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
      params.require(:recipe).permit(:name,:serves)
    end 
	def find_recipe
      @recipe = Recipe.find(params[:id])
    end
	def find_recipe_ingredients
      @ingredients = Recipe.find(params[:id]).ingredients
    end
end
