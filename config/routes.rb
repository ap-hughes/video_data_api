Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'api/v1/videodata#index'
  namespace 'api' do
    namespace 'v1' do
      resources :videodata
    end
  end
  get 'api/v1/videodata/new'
end
