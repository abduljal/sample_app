class StaticPagesController < ApplicationController
  def home
  end

  def help
  end
  
  def about
  @recipe = {"Ingredients" => ["tilapia", "salt", "chilli", "coconut oil"], "Steps" => ["defrost fist", "wipe dry", "sprinkle salt and chili", "heat pan","add oil", "fry till brown on each side"]}
  end
  
  def contact
  end
  
end
