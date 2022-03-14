class Books::CommentsController < CommentsController
  before_action :set_commentable, except: %i[index new show]

  private

  def set_commentable
    @commentable = Book.find(params[:book_id])
  end
end
