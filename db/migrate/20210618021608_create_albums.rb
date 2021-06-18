class CreateAlbums < ActiveRecord::Migration[6.1]
  def change
    create_table :albums do |t|
      t.string :name
      t.integer :artist_id
      t.integer :spotify_id
      t.string :cover_art_url

      t.timestamps
    end
  end
end
