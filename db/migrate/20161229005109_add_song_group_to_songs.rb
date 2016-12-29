class AddSongGroupToSongs < ActiveRecord::Migration[5.0]
  def change
    add_reference :songs, :song_group, foreign_key: true
  end
end
