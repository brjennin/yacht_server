Rails.application.routes.draw do
  scope 'api' do
    scope 'v1' do
      resources :songs, only: [:index]
    end
  end
end
