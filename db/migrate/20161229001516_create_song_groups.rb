class CreateSongGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :song_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end
