require 'json'

class ReportsController < ApplicationController
  def create
    params[:report][:user_id] = session[:user_id]
    @report = Report.new(report_params)
    @report.save
  end
  
  def destroy
    toBeNuked = JSON.parse(params[:report][:serialized_ids])
    toBeNuked.each do | key, value |
      @report = Report.find_by(id: value)
      @report.destroy
    end
  end

  private
  def report_params
    params.require(:report).permit(:album, :reason, :comment, :user_id, :report_type, :thread, :to_be_nuked, :post)
  end

end
