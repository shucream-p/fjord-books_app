class Books::CommentsController < CommentsController
  before_action :set_commentable, except: %i[index new show]
  before_action :set_render, only: :create

  private

  def set_commentable
    @commentable = Book.find(params[:book_id])
  end

  def set_render
    @template = 'books/show'
    @book = Book.find(params[:book_id])
  end
end
