require 'json'

class ReportsController < ApplicationController
  def create
    if !get_user.email_confirmed
      redirect_to request.referrer, notice: 'Please activate your email before sending reports'
    else
      params[:report][:user_id] = session[:user_id]
      @report = Report.new(report_params)
      @report.save
    end
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
    params.require(:report).permit(:reason, :comment, :user_id, :report_type, :target_id, :to_be_nuked)
  end

end
