class AlbumsController < ApplicationController
  def create
    album = Album.new(
      album: params[:name],
      artist: params[:artist],
    )
    if album.save
      render json: { message: "Album created successfully" }, status: :created
    else
      render json: { errors: album.errors.full_messages }, status: :bad_request
    end
  end

  def index
    albums = Album.all
    render json: albums
  end
end
