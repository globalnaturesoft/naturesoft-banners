Naturesoft::Banners::Engine.routes.draw do
  namespace :admin, module: 'admin' do
    resources :banners
    resources :banner_types
  end
end