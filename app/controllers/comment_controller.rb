class CommentController < ApplicationController

  get '/comment' do
    erb :new_comment
  end

  post '/new_comment/:id' do
    @comment = Comment.create(user: params[:user], comment_text: params[:comment_text])
    @comment.recipe_id = params[:id]
    @comment.save
    redirect to "/#{@comment.recipe_id}"
  end

  get '/:recipe_id/:id/delete' do
    @comment = Comment.find(params[:id])
    @comment.delete
    redirect to "/#{params[:recipe_id]}"
  end

end