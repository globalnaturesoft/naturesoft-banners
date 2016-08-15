module Naturesoft
  module Banners
    module Admin
      class OptionsController < Naturesoft::Admin::AdminController
        before_action :default_breadcrumb
        
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Banners", naturesoft_banners.admin_banners_path
        end
    
        # GET /partners
        def index
          add_breadcrumb "Settings", nil
          
          @options = Naturesoft::Option.options("banners")
        end
      end
    end
  end
end
