class MoviesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, only: [:create]
  require 'csv'
  require 'json'


    def index
      @movies = Movie.all
      respond_to do |format|
        format.html
        format.json { render json: @movies.to_json(methods: :average_score) }
      end
    end

    def exists
      movie = Movie.find_by(title: params[:title])
      exists = movie.present?
      render json: { exists: exists }
    end

  def submit
    Rating.submit(params[:file])
    redirect_to root_url, notice: "Notas submetidas."
  end

  def import
    if ['application/json', 'text/csv'].include?(params[:file].content_type)
      # Save the file to a temporary location
      file_path = Rails.root.join('tmp', params[:file].original_filename)
      File.open(file_path, 'wb') do |file|
        file.write(params[:file].read)
      end
  
      # Start the Sidekiq job to import the movies
      MovieImportWorker.perform_async(file_path.to_s, params[:file].content_type)
    end
  end

  def create
    @movie = Movie.new(movie_params)
  
    if @movie.save
      render json: @movie, status: :created
    else
      puts @movie.errors.full_messages
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :director, :average_score, :updated_at, :created_at )
  end
end   
