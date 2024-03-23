require 'csv'
require 'json'

class MovieImportWorker
  include Sidekiq::Worker
  include Sidekiq::Status::Worker

  def perform(file_path, content_type)
    if content_type == 'application/json'
      movies = JSON.parse(File.read(file_path))
  
      movies.each do |movie|
        Movie.find_or_create_by!(id: movie['id']) do |m|
          m.title = movie['title']
          m.director = movie['director']
          m.average_score = movie['average_score']
          m.created_at = movie['created_at']
          m.updated_at = movie['updated_at']
        end
      end
    elsif content_type == 'text/csv'
      CSV.foreach(file_path, headers: true) do |row|
        Movie.find_or_create_by!(id: row['id']) do |m|
          m.title = row['title']
          m.director = row['director']
          m.average_score = row['average_score']
          m.created_at = row['created_at']
          m.updated_at = row['updated_at']
        end
      end
    else
      Rails.logger.error "Unsupported content type: #{content_type}"
    end
  end
end