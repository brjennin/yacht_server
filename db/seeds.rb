def create_song(name:, artist:, url:, album_art:)
  song = Song.find_by(name: name, artist: artist)
  attrs = {
      album_art: album_art,
      url: url,
  }
  if song
    song.update!(attrs)
  else
    Song.create!(attrs.merge(name: name, artist: artist))
  end
end

create_song(name: 'Maneater',
            artist: 'Hall & Oates',
            album_art: 'https://i.scdn.co/image/02208eaf815fff1e5820380bbefa957f38148ea8',
            url: 'https://p.scdn.co/mp3-preview/85538cf6e2a89e0fe2c85049cff9eece282b7151',
)

create_song(name: 'Private Eyes',
            artist: 'Hall & Oates',
            album_art: 'https://i.scdn.co/image/7c270ba6ca0991b05079aed0460628857270e7b2',
            url: 'https://p.scdn.co/mp3-preview/4a558e1144aba588135ba366ea5a705a3f653b94',
)
