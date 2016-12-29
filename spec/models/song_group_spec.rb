require 'rails_helper'

describe SongGroup, type: :model do
  describe 'Validations' do
    subject { SongGroup.new(attrs) }
    let(:attrs) { valid_attrs }
    let(:valid_attrs) { {name: 'name'} }

    it 'allows creation of valid records' do
      expect(subject).to be_valid
    end

    describe 'without a name' do
      let(:attrs) { valid_attrs.merge(name: '') }

      it 'prevents creation of the record' do
        expect(subject).to_not be_valid
      end
    end
  end

  describe '#as_json' do
    let!(:song_one) { Song.create!(name: 'boogie woogie', artist: 'elbis', url: 'url', album_art: 'art', song_group: subject) }
    let!(:song_two) { Song.create!(name: 'nimbus', artist: 'Todd', url: 'url2', album_art: 'art2', song_group: subject) }
    subject { SongGroup.create!(name: 'fools gold vol 1') }

    it 'returns a subset of the fields' do
      expect(subject.as_json).to eq({
        id: subject.id,
        group: 'fools gold vol 1',
        sounds: [
          {
            id: song_one.id,
            name: 'boogie woogie',
            artist: 'elbis',
            url: 'url',
            album_art: 'art',
            created_at: song_one.created_at,
          },
          {
            id: song_two.id,
            name: 'nimbus',
            artist: 'Todd',
            url: 'url2',
            album_art: 'art2',
            created_at: song_two.created_at,
          }
        ]
      })
    end
  end
end
