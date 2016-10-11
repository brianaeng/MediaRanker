class AlbumsController < ApplicationController
  def index
    @albums = Album.all.sort_by { |album_hash| [album_hash[:num_votes], (-album_hash[:id])] }.reverse
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

    redirect_to album_path(@album.id)
  end

  def upvote
    find

    @album.num_votes += 1
    @album.save

    redirect_to album_path(@album.id)
  end

  def edit
    find
  end

  def update
    find

    @album.title = params[:album][:title]
    @album.artist = params[:album][:artist]
    @album.description = params[:album][:description]

    @album.save

    redirect_to album_path(@album.id)
  end

  def destroy
    find

    @album.destroy

    redirect_to albums_path
  end

  private
  def find
    @album = Album.find(params[:id].to_i)
  end
end
