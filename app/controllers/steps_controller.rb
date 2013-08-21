class StepsController < ApplicationController
  def new
	@recipe = Recipe.find(params[:id])
	@step=Step.new(:recipe => @recipe)
  end
  
  def create
    @step = Step.new(step_params)
    if @step.save
      flash[:success] = "Yay! a new step for the dish "+@step.order.to_s
      redirect_to add_step_path(:id => @step.recipe_id)
    else
       render add_step_path(:id => @step.recipe_id)
    end
  end
  
   private

    def step_params
      params.require(:step).permit(:process,:order,:recipe_id)
    end
end
