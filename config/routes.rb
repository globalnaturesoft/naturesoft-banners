Naturesoft::Banners::Engine.routes.draw do
  namespace :backend, module: 'backend', path: "backend/banners" do
    resources :banners do
      collection do
        put "enable"
        put "disable"
        delete 'delete'
        get "select2"
      end
    end
    resources :categories do
      collection do
        put 'enable'
        put 'disable'
        delete 'delete'
        get "select2"
      end
    end
  end
end