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

  def spotify_authorize
    response = HTTP.post(
      "https://accounts.spotify.com/api/token",
      form: {
        grant_type: "authorization_code",
        code: params[:code],
        redirect_uri: "http://localhost:8080",
        client_id: "82a96d9b37a94d40bd0646e83ed32d6e",
        client_secret: "9e7515a9678b496c9910669bd9b7c4a9",
      },
    )
    render json: JSON.parse(response.body)
  end
end
