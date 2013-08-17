class StepsController < ApplicationController
  def new
	require 'logger'
	  log = Logger.new('Slog.txt')
	  log.debug "Recipe id : "+params[:id].to_s
	@recipe = Recipe.find(params[:id])
	@step=Step.new(:recipe => @recipe)
  end
  
  def create
    @step = Step.new(step_params)
    if @step.save
		require 'logger'
	  log = Logger.new('Slog.txt')
	  log.debug "End Recipe id : "+@step.recipe_id.to_s
      flash[:success] = "Yay! a new step for the dish "+@step.order
      redirect_to add_step_path(:id => @step.recipe_id)
    else
       redirect_to add_step_path(:id => @step.recipe_id)
    end
  end
  
   private

    def step_params
      params.require(:step).permit(:process,:order,:recipe_id)
    end
end
