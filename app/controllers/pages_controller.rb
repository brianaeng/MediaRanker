class PagesController < ApplicationController
  def home
    @movies = Movie.all

    @top_movies = @movies.sort_by { |k| k[:num_votes] }

    @books = Book.all

    @top_books = @books.sort_by { |k| k[:num_votes] }

    @albums = Album.all

    @top_albums = @albums.sort_by { |k| k[:num_votes] }
  end
end
