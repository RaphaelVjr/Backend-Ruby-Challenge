class UserMoviesController < ApplicationController
  protect_from_forgery prepend: true
  before_action :authenticate_user!

  def create
    @movie = Movie.find(params[:user_movie][:movie_id])
    current_user.movies << @movie
    @user_movie = current_user.user_movies.find_by(movie_id: @movie.id)
    @user_movie.update(average_score: params[:user_movie][:average_score])
    redirect_to movies_path
  end

  def update
    @user_movie = current_user.user_movies.find_by(movie_id: params[:user_movie][:movie_id])
    @user_movie.update(average_score: params[:user_movie][:average_score])
    redirect_to movies_path
  end
end
