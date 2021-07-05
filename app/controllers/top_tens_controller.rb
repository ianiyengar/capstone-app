class TopTensController < ApplicationController
  def create
    topten = TopTen.new(
      user_id: current_user.id,
      album_id: params[:album_id],
    )
    if topten.save
      render json: topten
    else
      render json: { errors: topten.errors.full_messages }, status: 422
    end
  end
end
