class Api::V1::GenresController < ApplicationController

  def index
    limit = (params[:limit] && params[:limit].to_i) || 20
    offset = (params[:offset] && params[:offset].to_i) || 0
    render json: Genre.all.limit(limit).offset(offset)
  end

  def show
    render json: Genre.find_by(id: params[:id])
  end

  def create
    genre = Genre.new(genre_params)
    if genre.save!
      render json: { success: 'genre successfully saved' }
    else
      render json: { error: m.errors }
    end
  end

  def update
    genre = update_genre
    if genre.save!
      render json: { success: 'genre successfully updated' }
    else
      render json: { error: m.errors }
    end
  end

  def destroy
    if genre.find_by(params[:id]).destroy
      render json: { success: 'genre successfully deleted' }
    else
      render json: { error: 'failed to delete genre' }
    end
  end

private

  def update_genre
    g = Movie.find_or_create_by(id: params[:id])
    g.name = params[:name] if params[:name]
    g.description = params[:description] if params[:description]
    g
  end

  def genre_params
    params.permit(
      :name,
      :description
    )
  end
end
