class JobsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
  	@jobs = Job.all
  end

  def new
  	@job = Job.new
  end

  def create
  	@job = current_user.jobs.new(job_params)

  	if @job.save
  		redirect_to jobs_path, notice: 'Successfully created Job'
  	else
  		render :new
  	end
  end

  private

  def job_params
  	params.require(:job).permit(:name, :location, :description,:deadline)
  end
end
