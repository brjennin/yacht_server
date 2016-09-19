require 'rails_helper'

describe SongsController, type: :controller do

  describe 'GET index' do
    subject { get :index }

    let(:songs) {
      [
          double(Song, as_json: {id: 123}),
          double(Song, as_json: {id: 555}),
      ]
    }

    before do
      allow(Song).to receive(:all).and_return(songs)
    end

    it 'returns a success response code' do
      subject
      expect(response).to be_success
    end

    it 'renders json for the songs' do
      subject
      expect(JSON[response.body]).to match_array([{'id' => 123}, {'id' => 555}])
    end
  end

end
