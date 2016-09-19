require 'rails_helper'

describe Song, type: :model do
  describe 'Validations' do
    subject { Song.new(attrs) }
    let(:attrs) { valid_attrs }
    let(:valid_attrs) { {name: 'name', artist: 'artist', url: 'url', album_art: 'album_art'} }

    it 'allows creation of valid records' do
      expect(subject).to be_valid
    end

    describe 'without a name' do
      let(:attrs) { valid_attrs.merge(name: '') }

      it 'prevents creation of the record' do
        expect(subject).to_not be_valid
      end
    end

    describe 'without an artist' do
      let(:attrs) { valid_attrs.merge(artist: '') }

      it 'prevents creation of the record' do
        expect(subject).to_not be_valid
      end
    end

    describe 'without a url' do
      let(:attrs) { valid_attrs.merge(url: '') }

      it 'prevents creation of the record' do
        expect(subject).to_not be_valid
      end
    end

    describe 'without an album art' do
      let(:attrs) { valid_attrs.merge(album_art: '') }

      it 'prevents creation of the record' do
        expect(subject).to_not be_valid
      end
    end
  end

  describe '#as_json' do
    subject { Song.create!(name: 'boogie woogie', artist: 'elbis', url: 'url', album_art: 'art') }

    it 'returns a subset of the fields' do
      expect(subject.as_json).to eq({
                                        id: subject.id,
                                        name: 'boogie woogie',
                                        artist: 'elbis',
                                        url: 'url',
                                        album_art: 'art',
                                        created_at: subject.created_at,
                                    })
    end
  end
end
