class UpdateTorrentHash < ActiveRecord::Migration[5.1]
  def change
    add_column :torrents, :torrent_hash, :text
    remove_column :torrents, :hash
  end
end
