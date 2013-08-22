class DescriptionsController < ApplicationController
	
	before_filter :find_recipe, :only => [:new, :edit, :update]
	
	def new
	 @recipe = Recipe.find(params[:id])
	@description=Description.new
	@currentdescriptions=Description.uniq.pluck(:classification)
	end
  
 
  def create
    @description = Description.new(description_params)
    if @description.save
      flash[:success] = "Yay! a new description for the dish - "+@description.classification
      redirect_to add_description_path(:id => @description.recipe_id)
    else
       render add_description_path(:id => @recipe.id)
    end
  end
  
  def edit
	@descriptions=@recipe.descriptions
	@description=Description.new
	@currentdescriptions=Description.uniq.pluck(:classification)
  end
  
  def destroy
	desc = Description.find(params[:id])
	recipe=Recipe.find(desc.recipe_id)
	if desc.destroy
	flash[:success] = "Yay! a description deleted for the dish - "+recipe.name
      redirect_to edit_recipe_home_path+"/"+recipe.id.to_s
    else
       redirect_to recipe
    end
  end
  
  def update
	@description = Description.new(description_params)
    if @description.save
      flash[:success] = "Yay! a new description for the dish - "+@description.classification
      redirect_to edit_recipe_home_path+"/"+@recipe.id.to_s
    else
       redirect_to @recipe
    end
  end
  
   private

    def description_params
      params.require(:description).permit(:classification,:recipe_id)
    end
	
	def find_recipe
      @recipe = Recipe.find(params[:id])
    end
end