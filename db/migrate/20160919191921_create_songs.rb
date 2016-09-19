class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.string :album_art, null: false
      t.string :artist, null: false

      t.timestamps
    end
  end
end
