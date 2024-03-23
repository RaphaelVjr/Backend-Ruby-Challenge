class JobsController < ApplicationController
    def status
      job_id = params[:job_id]
      status = Sidekiq::Status::status(job_id)
      render json: { status: status }
    end
  end