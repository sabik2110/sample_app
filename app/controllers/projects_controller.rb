class ProjectsController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
  before_filter :admin_user,   :only => :destroy
  before_filter :newcomer


  def index
    @title = "All projects"
    @projects = Project.all
  end

  def show
    @project =Project.find(params[:id])
    @title = @project.name
  end

  def new
    @project = Project.new
    @title = "add new project"
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      flash[:success] = "Project was added!"
      redirect_to @project
    else
      @title = "add new project"
      render 'new'
    end
  end

  def edit
    @title = "Edit project"
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      flash[:success] = "Project was updated."
      redirect_to @project
    else
      @title = "Edit project"
      render 'edit'
    end
  end



  def destroy
    if Project.find(params[:id]).destroy
      flash[:success] = "Project destroyed."
      redirect_to projects_path
    else
      flash[:error] = "Project wasn't destroyed because of dependencies"
      redirect_to projects_path
    end
  end

end
