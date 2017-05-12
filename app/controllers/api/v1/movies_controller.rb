class Api::V1::MoviesController < ApplicationController

  def index
    limit = (params[:limit] && params[:limit].to_i) || 20
    offset = (params[:offset] && params[:offset].to_i) || 0
    render json: Movie.all.limit(limit).offset(offset)
  end

  def show
    movie = Movie.find_by(id: params[:id])
    render json: { 'movie' => movie, 'genre' => movie.genres, 'torrents' => movie.torrents}
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
    if Movie.find_by(params[:id]).destroy
      render json: { success: 'movie successfully deleted' }
    else
      render json: { error: 'failed to delete movie' }
    end
  end

private

  def update_movie
    m = Movie.find_or_create_by(id: params[:id])
    m.title = params[:title] if params[:title]
    m.description = params[:description] if params[:description]
    m.year = params[:year] if params[:year]
    m.runtime = params[:runtime] if params[:runtime]
    m.rating = params[:rating] if params[:rating]
    m.image = params[:image] if params[:image]
    m.genre_ids = params[:genre_ids] if params[:genre_ids]
    m.torrent_ids = params[:torrent_ids] if params[:torrent_ids]
    m
  end

  def movies_params
    params.permit(
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
