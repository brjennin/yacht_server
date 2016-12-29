class SongsController < ApplicationController

  def index
    song_groups = SongGroup.all
    render json: song_groups
  end

end
