class RecipeController < ApplicationController

  get '/new' do
    erb :new_recipe
  end

  post '/new' do
    @recipe = Recipe.create(params)
    @comments = Comment.where(recipe_id: @recipe.id)
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

  get '/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit_recipe
  end

  post '/:id/edit' do
    @recipe = Recipe.find(params[:id])
    @recipe.name = params[:name]
    @recipe.user = params[:user]
    @recipe.url = params[:url]
    @recipe.description = params[:description]
    @recipe.save
    redirect to "/#{@recipe.id}"
  end

  get '/:id' do
    @recipe = Recipe.find(params[:id])
    @comments = Comment.where(recipe_id: params[:id])
    erb :recipe
  end

end