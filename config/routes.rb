Naturesoft::Banners::Engine.routes.draw do
  namespace :admin, module: 'admin', path: "admin/banners" do
    resources :banners do
      collection do
        put "enable"
        put "disable"
      end
    end
    
    # Setting page
    get 'settings' => 'options#index', :as => :options
  end
end