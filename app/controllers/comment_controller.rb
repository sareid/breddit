class CommentController < ApplicationController

  get '/comment' do
    erb :new_comment
  end

  post '/new_comment/:id' do
    @user = User.find_or_create_by(name: params[:user])
    @comment = Comment.create(comment_text: params[:comment_text])
    @comment.user = @user
    @comment.recipe_id = params[:id]
    @comment.save
    redirect to "/#{@comment.recipe_id}"
  end

  get '/:recipe_id/:id/delete' do
    @comment = Comment.find(params[:id])
    @comment.delete
    redirect to "/#{params[:recipe_id]}"
  end

  get '/:recipe_id/:id/edit' do
    @comment = Comment.find(params[:id])
    erb :edit_comment
  end

  post '/:recipe_id/:id/edit' do
    @comment = Comment.find(params[:id])
    @comment.user = params[:user]
    @comment.comment_text = params[:comment_text]
    @comment.save

    redirect to "/#{@comment.recipe_id}"
  end

end