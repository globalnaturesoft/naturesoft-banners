Naturesoft::Banners::Engine.routes.draw do
  namespace :admin, module: 'admin', path: "admin/banners" do
    resources :banners do
      collection do
        put "enable"
        put "disable"
        delete 'delete'
      end
    end
  end
end