class Reports::CommentsController < CommentsController
  before_action :set_commentable, except: %i[index new show]
  before_action :set_render, only: :create

  private

  def set_commentable
    @commentable = Report.find(params[:report_id])
  end

  def set_render
    @template = 'reports/show'
    @report = Report.find(params[:report_id])
  end
end
