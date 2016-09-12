Naturesoft::Banners::Engine.routes.draw do
  namespace :admin, module: 'admin', path: "admin/banners" do
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