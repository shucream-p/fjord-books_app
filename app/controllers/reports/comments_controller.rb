class Reports::CommentsController < CommentsController
  before_action :set_commentable, except: %i[index new show]

  private

  def set_commentable
    @commentable = Report.find(params[:report_id])
  end
end
