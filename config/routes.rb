Naturesoft::Core::Engine.routes.draw do
  scope module: 'banners' do
    namespace :admin do
      resources :banners
      resources :banner_types
    end
  end
end