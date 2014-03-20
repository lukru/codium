class JobsController < ApplicationController

  def index
    job = Job.new

    page = (params[:page] || 1).to_i
    per_page = 10

  	response = job.jobs(page, per_page)
    @total_count = response['totalresults'].to_i

    puts response['results']['result'].inspect

    @jobs = response['results']['result']
    @paginator = @jobs.paginate(page, per_page, @total_count)
    @start = response['start'].to_i
  end
end
