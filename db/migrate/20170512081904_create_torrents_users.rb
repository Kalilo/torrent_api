class CreateTorrentsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :torrents_movies do |t|
      t.references  :torrent, foreign_key: true, index: true
      t.references  :movie, foreign_key: true, index: true
      t.timestamps
    end
  end
end
