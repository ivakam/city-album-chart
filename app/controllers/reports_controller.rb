class ReportsController < ApplicationController

  def create
    params[:report][:user_id] = session[:user_id]
    @report = Report.new(report_params)
    @report.save
  end

  private
  def report_params
    params.require(:report).permit(:album, :reason, :comment, :user_id)
  end

end
