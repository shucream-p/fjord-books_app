class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]
  
  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    
    if @comment.save
      redirect_to @commentable, notice: 'Comment was successfully created.'
    else
      flash.now[:alert] = 'Please enter the content.'
      render @template
    end
  end

  def edit; end
  
  def update
    @comment.update(comment_params)
    redirect_to @commentable, notice: 'Comment was successfully updated.'
  end

  def destroy
    @comment.destroy
    redirect_to @commentable, notice: 'Comment was successfully destroyed.'
  end

  private

  def set_comment
    @comment = current_user.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
