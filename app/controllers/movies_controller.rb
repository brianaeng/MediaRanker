class MoviesController < ApplicationController
  def index
    @all_movies = Movie.all

    @movies = @all_movies.sort_by { |movie_hash| [movie_hash[:num_votes], (-movie_hash[:id])] }.reverse
  end

  def show
    find
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new

    @movie.title = params[:movie][:title]
    @movie.num_votes = 0
    @movie.director = params[:movie][:director]
    @movie.description = params[:movie][:description]

    @movie.save

    if @movie.save
      redirect_to movie_path(@movie.id)
    else
      redirect_to new_movie_path
    end
  end

  def upvote
    find

    @movie.num_votes += 1
    @movie.save

    redirect_to movie_path(@movie.id)
  end

  def edit
    find
  end

  def update
    find

    @movie.title = params[:movie][:title]
    @movie.director = params[:movie][:director]
    @movie.description = params[:movie][:description]

    @movie.save

    redirect_to movie_path(@movie.id)
  end

  def destroy
    find

    @movie.destroy

    redirect_to movies_path
  end

  private
  def find
    @movie = Movie.find(params[:id])
  end
end
