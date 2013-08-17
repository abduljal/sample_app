class RecipesController < ApplicationController
  def new
  @recipe = Recipe.new
  end
  
  def show
    @recipe = Recipe.find(params[:id])
  end
  
  def addstep
    @recipe = Recipe.find(params[:id])
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:success] = "Yay! a new dish"
	  #log recipe id
	  require 'logger'
	  log = Logger.new('log.txt')
	  log.debug "Recipe name : "+@recipe.name
	  log.debug "Recipe id : "+@recipe.id.to_s
      redirect_to add_ingredient_path(:id => @recipe.id)
    else
      render 'new'
    end
  end

  private

    def recipe_params
      params.require(:recipe).permit(:name)
    end
end
