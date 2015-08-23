class RecipesController < ApplicationController
  before_action :authenticate_user!
  def index

    if params[:id].present?

      @r = Recipe.where({:user_id => params[:id]})
      @q = @r.ransack(params[:q])
      @recipes = @q.result

    else

    @r = current_user.recipes
    @q = @r.ransack(params[:q])
    @recipes = @q.result

    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new
    @recipe.user_id = params[:user_id]
    @recipe.occassion = params[:occassion]
    @recipe.rating = params[:rating]
    @recipe.image = params[:image]
    @recipe.preparation = params[:preparation]
    @recipe.ingridients = params[:ingridients]
    @recipe.description = params[:description]
    @recipe.mealtype = params[:mealtype]
    @recipe.cuisine = params[:cuisine]
    @recipe.title = params[:title]

    if @recipe.save
      redirect_to "/recipes", :notice => "Recipe created successfully."
    else
      render 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])

    @recipe.user_id = params[:user_id]
    @recipe.occassion = params[:occassion]
    @recipe.rating = params[:rating]
    @recipe.image = params[:image]
    @recipe.preparation = params[:preparation]
    @recipe.ingridients = params[:ingridients]
    @recipe.description = params[:description]
    @recipe.mealtype = params[:mealtype]
    @recipe.cuisine = params[:cuisine]
    @recipe.title = params[:title]

    if @recipe.save
      redirect_to "/recipes", :notice => "Recipe updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])

    @recipe.destroy

    redirect_to "/recipes", :notice => "Recipe deleted."
  end
end
