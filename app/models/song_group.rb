class SongGroup < ApplicationRecord
  has_many :songs
  validates_presence_of :name

  def as_json(options={})
    {
      id: id,
      group: name,
      sounds: songs.as_json,
    }
  end

end
