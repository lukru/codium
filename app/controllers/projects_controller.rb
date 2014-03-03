class ProjectsController < ApplicationController
before_action :set_project, only: [ :show, :edit, :update, :destroy]

def index
  @projects = Project.order("created_at desc").all
end

def new
  @project = Project.new
end

def show
end

def edit
end

def create
  @project = Project.new(project_params)

  if @project.save
    redirect_to @project
  else
    render action:"new", notice:"something went wrong here .."
  end
end

def update
end

def destroy
end

private

def set_project
  @project = Project.find_by_id params[:id]
end

# Never trust parameters from the scary internet, only allow the white list through.
def project_params
  params.require(:project).permit(:name)
  end


end