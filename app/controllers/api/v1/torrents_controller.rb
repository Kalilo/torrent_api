class Api::V1::TorrentsController < ApplicationController
  def index
    limit = (params[:limit] && params[:limit].to_i) || 20
    offset = (params[:offset] && params[:offset].to_i) || 0
    render json: Torrent.all.limit(limit).offset(offset)
  end

  def show
    render json: Torrent.find_by(id: params[:id])
  end

  def create
    torrent = Torrent.new(torrent_params)
    if torrent.save!
      render json: { success: 'torrent successfully saved' }
    else
      render json: { error: m.errors }
    end
  end

  def update
    torrent = update_torrent
    if torrent.save!
      render json: { success: 'torrent successfully updated' }
    else
      render json: { error: m.errors }
    end
  end

  def destroy
    if torrent.find_by(params[:id]).destroy
      render json: { success: 'torrent successfully deleted' }
    else
      render json: { error: 'failed to delete torrent' }
    end
  end

private

  def update_torrent
    t = Torrent.find_or_create_by(id: params[:id])
    t.url = params[:url] if params[:url]
    t.torrent_hash = params[:torrent_hash] if params[:torrent_hash]
    t.quality = params[:quality] if params[:quality]
    t.size = params[:size] if params[:size]
    t.seeds = params[:seeds] if params[:seeds]
    t.peers = params[:peers] if params[:peers]
    t
  end

  def torrent_params
    params.permit(
      :url,
      :torrent_hash,
      :quality,
      :size,
      :seeds,
      :peers
    )
  end
end
