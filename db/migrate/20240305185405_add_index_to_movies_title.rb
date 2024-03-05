class AddIndexToMoviesTitle < ActiveRecord::Migration[6.0]
  def change
    add_index :movies, :title, unique: true
  end
end