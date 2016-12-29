class Song < ApplicationRecord
  belongs_to :song_group
  validates_presence_of :name, :artist, :url, :album_art

  def as_json(options={})
    {
        id: id,
        name: name,
        artist: artist,
        url: url,
        album_art: album_art,
        created_at: created_at
    }
  end
end
