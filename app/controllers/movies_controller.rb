class MoviesController < ApplicationController
  def index
    @movies = Movie.all
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
  end

  def destroy
    find

    @movie.destroy
  end

  private
  def find
    @movie = Movie.find(params[:id].to_i)
  end
end
