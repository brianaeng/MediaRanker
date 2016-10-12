class PagesController < ApplicationController
  def home
    @movies = Movie.all

    # Sort by num_votes (which is lowest to highest) then by negative id (because first I want the newest on top) and then I run reverse so the result it highest upvotes and highest id (aka newest)

    @top_movies = @movies.sort_by { |movie_hash| [movie_hash[:num_votes], (-movie_hash[:id])] }.reverse.take(10)

    # @movies = Movie.order(num_votes: :desc).limit(7)

    @books = Book.all

    @top_books = @books.sort_by { |book_hash| [book_hash[:num_votes], (-book_hash[:id])] }.reverse.take(10)

    @albums = Album.all

    @top_albums = @albums.sort_by { |album_hash| [album_hash[:num_votes], (-album_hash[:id])] }.reverse.take(10)
  end
end
