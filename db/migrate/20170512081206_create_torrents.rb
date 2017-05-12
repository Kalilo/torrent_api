class CreateTorrents < ActiveRecord::Migration[5.1]
  def change
    create_table :torrents do |t|
      t.text :url
      t.text :hash
      t.string :quality
      t.numeric :size
      t.integer :seeds
      t.integer :peers

      t.timestamps
    end

    add_index :torrents, :seeds
    add_index :torrents, :peers
  end
end
