class DescriptionsController < ApplicationController
  def new
	
	@recipe = Recipe.find(params[:id])
	@description=Description.new
	@currentdescriptions=Description.uniq.pluck(:classification)
  end
  
  def create
    @description = Description.new(description_params)
    if @description.save
		require 'logger'
	  log = Logger.new('Dlog.txt')
	  log.debug "End Recipe id : "+@description.recipe_id.to_s
      flash[:success] = "Yay! a new description for the dish - "+@description.classification
      redirect_to add_description_path(:id => @description.recipe_id)
    else
       render add_description_path(:id => @recipe.id)
    end
  end
  
   private

    def description_params
      params.require(:description).permit(:classification,:recipe_id)
    end
end