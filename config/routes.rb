Naturesoft::Banners::Engine.routes.draw do
  namespace :admin, module: 'admin', path: "admin/content" do
    resources :banners do
      collection do
        put "enable"
        put "disable"
      end
    end
    resources :banner_types do
      collection do
        put "enable"
        put "disable"
      end
    end
  end
end