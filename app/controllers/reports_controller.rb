require 'json'

class ReportsController < ApplicationController
  def create
    params[:report][:user_id] = session[:user_id]
    @report = Report.new(report_params)
    @report.save
  end
  
  def destroy
    toBeNuked = JSON.parse(params[:to_be_nuked])
    toBeNuked.each do | report |
      @report = Report.find_by(id: report)
      @report.destroy
    end
  end

  private
  def report_params
    params.require(:report).permit(:album, :reason, :comment, :user_id, :report_type, :thread, :to_be_nuked)
  end

end
