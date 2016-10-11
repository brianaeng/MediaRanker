class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def show
    find
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new

    @album.title = params[:album][:title]
    @album.num_votes = 0
    @album.artist = params[:album][:artist]
    @album.description = params[:album][:description]

    @album.save
  end

  def upvote
    find

    @album.num_votes += 1
  end

  def edit
    find
  end

  def update
    @album.title = params[:album][:title]
    # @album.num_votes = @album.num_votes #Do I need this?
    @album.artist = params[:album][:artist]
    @album.description = params[:album][:description]

    @album.save

    redirect_to album_show_path
  end

  def destroy
    find

    @album.destroy
  end

  private
  def find
    @album = Album.find(params[:id].to_i)
  end
end
