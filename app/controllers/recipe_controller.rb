class RecipeController < ApplicationController

  get '/new' do
    erb :new_recipe
  end

  post '/new' do
    @recipe = Recipe.create(params)
    erb :recipe
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :recipes
  end

  get '/:slug/delete' do
    @recipe = Recipe.find_by_slug(:slug)
    @recipe.delete
    redirect to '/'
  end

  get '/:id' do
    @recipe = Recipe.find(params[:id])
    @comments = Comment.where(recipe_id: params[:id])
    erb :recipe
  end

end