class StepsController < ApplicationController

  before_filter :find_recipe, :only => [:new, :edit_add]
  before_filter :find_step, :only => [:edit, :update, :destroy]
  
  def new
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
  
  def edit_add
	@step=Step.new
	@current_steps=@recipe.steps
  end
  
  def create_edit
   @step=Step.new(step_params)
	recipe=Recipe.find(@step.recipe_id)
    if @step.save
      flash[:success] = "Yay! a new step for the dish in edit- "+@step.order.to_s
      redirect_to edit_recipe_home_path+"/"+recipe.id.to_s
    else
       render recipe
    end
  end
  
   def edit
	@recipe=Recipe.find(@step.recipe_id)
  end
  
  def update
	@step.update_attributes(step_params)
	recipe=Recipe.find(@step.recipe_id)
	if @step.save
      flash[:success] = "Yay! edited - "+@step.order.to_s
	 
       redirect_to edit_recipe_home_path+"/"+recipe.id.to_s
    else
      redirect_to recipe
    end
  end
  
  def destroy
	recipe=Recipe.find(@step.recipe_id)
	if @step.destroy
	flash[:success] = "Yay! an step deleted for the dish - "+recipe.name
      redirect_to edit_recipe_home_path+"/"+recipe.id.to_s
    else
       redirect_to recipe
    end
  end
  
   private

    def step_params
      params.require(:step).permit(:process,:order,:recipe_id)
    end
	
	def find_recipe
      @recipe = Recipe.find(params[:id])
    end
	def find_step
      @step=Step.find(params[:id])
    end
end
