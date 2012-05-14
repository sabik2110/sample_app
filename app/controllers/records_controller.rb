class RecordsController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
  before_filter :newcomer

  def new
    @title = "add new record"
    @record = Record.new
    @record.reported_minutes = Time.parse("00:00")
  end

  def index

    @records = Record.all(:conditions => " user_id = '#{current_user.id}' and added_time = '#{session[:calendar_date]}' ")

    @records.each do |record|
      record.project = Project.find(record.project_id)
    end

    @records.each do |record|
      record.activity = Activity.find(record.activity_id)
    end

    @title = "Show all reports"
  end

  def show
    @record = Record.find(params[:id])
    @record.project = Project.find(@record.project_id)
    @record.activity = Activity.find(@record.activity_id)
    @title = @record.id
  end

  def create
    @record = Record.new(params[:record])
    @record.user_id = current_user.id
    @record.added_time = session[:calendar_date]
    if @record.save
      flash[:success] = "Report ##{@record.id} was added!"
      redirect_to root_path
    else
      @title = "Add new report"
      render 'new'
    end
  end

  def edit
    @title = "Edit record"
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    id = @record.id
    if @record.update_attributes(params[:record])
      flash[:success] = "Report ##{id} was updated."
      redirect_to root_path
    else
      @title = "Edit report"
      render 'edit'
    end
  end

  def destroy
    Record.find(params[:id]).destroy
    flash[:success] = "Report was destroyed."
    redirect_to root_path
  end
end


