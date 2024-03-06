class MoviesController < ApplicationController
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
    if params[:file].content_type == 'application/json'
      movies = JSON.parse(params[:file].read)

      movies.each do |movie|
        Movie.create!(id: movie['id'], title: movie['title'], director: movie['director'], average_score: movie['average_score'], created_at: movie['created_at'], updated_at: movie['updated_at'])
      end
    elsif params[:file].content_type == 'text/csv'

      CSV.foreach(params[:file].path, headers: true) do |row|
        Movie.create!(id: row['id'], title: row['title'], director: row['director'], average_score: row['average_score'], created_at: row['created_at'], updated_at: row['updated_at'])
      end
    else
      return redirect_to root_url, alert: "Tipo de arquivo não suportado."
    end

    redirect_to root_url, notice: "Filmes importados."
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
