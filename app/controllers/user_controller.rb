class UserController < ApplicationController

  get '/user/:id' do
    @user = User.find(params[:id])
    @recipes = Recipe.where(user_id: params[:id])
    @comments = Comment.where(user_id: params[:id])
    erb :'user/user'
  end

end