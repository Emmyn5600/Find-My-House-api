Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :houses
      resources :rents
    end
  end
  resources :users, param: :id
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
