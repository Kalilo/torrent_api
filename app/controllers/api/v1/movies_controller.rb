class Api::V1::MoviesController < ApplicationController

  def index
    limit = (params[:limit] && params[:limit].to_i) || 20
    offset = (params[:offset] && params[:offset].to_i) || 0
    render json: Movie.all.limit(limit).offset(offset)
  end

  def show
    render json: Movie.find_by(id: params[:id])
  end

  def create
    movie = Movie.new(movies_params)
    if movie.save!
      render json: { success: 'movie successfully saved' }
    else
      render json: { error: m.errors }
    end
  end

  def update
    movie = update_movie
    if movie.save!
      render json: { success: 'movie successfully updated' }
    else
      render json: { error: m.errors }
    end
  end

  def destroy
    if Movie.find_by(params[:movie][:id]).destroy
      render json: { success: 'movie successfully deleted' }
    else
      render json: { error: 'failed to delete movie' }
    end
  end

private

  def update_movie
    m = Movie.find_by(id: params[:movie][:id])
    m.title = params[:movie][:title] if params[:movie][:title]
    m.description = params[:movie][:description] if params[:movie][:description]
    m.year = params[:movie][:year] if params[:movie][:year]
    m.runtime = params[:movie][:runtime] if params[:movie][:runtime]
    m.rating = params[:movie][:rating] if params[:movie][:rating]
    m.image = params[:movie][:image] if params[:movie][:image]
    m.genre_ids = params[:movie][:genre_ids] if params[:movie][:genre_ids]
    m.torrent_ids = params[:movie][:torrent_ids] if params[:movie][:torrent_ids]
    m
  end

  def movies_params
    params.require(:movie).permit(
      :title,
      :description,
      :year,
      :runtime,
      :rating,
      :image,
      :genre_ids,
      :torrent_ids
    )
  end
end
