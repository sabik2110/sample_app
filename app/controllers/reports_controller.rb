require 'Time'

class ReportsController < ApplicationController

  before_filter :authenticate
  before_filter :newcomer

  def daily_report

    @title = "Daily Report"
    if params[:date]
      session[:calendar_date] = params[:date]
    end

    @records = Record.all(:conditions => " user_id = '#{current_user.id}' and added_time = '#{session[:calendar_date]}' ")

    @records.each do |record|
      record.project = Project.find(record.project_id)
    end

    @records.each do |record|
      record.activity = Activity.find(record.activity_id)
    end

  end

  def consolidated_report
    @title = "Consolidated Report"

    calendar_date = Date.parse(session[:calendar_date])

    @records = Record.all(:conditions => " user_id = '#{current_user.id}' and added_time BETWEEN '#{calendar_date.at_beginning_of_month - 1.day}' AND '#{calendar_date.at_beginning_of_month.next_month}' ", :order => 'added_time')

    @records.each do |record|
      record.project = Project.find(record.project_id)
    end

    @records.each do |record|
      record.activity = Activity.find(record.activity_id)
    end

  end
end
