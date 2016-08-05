module Naturesoft
  module Banners
    module Admin
      class BannerTypesController < Naturesoft::Admin::AdminController
        before_action :set_banner_type, only: [:show, :edit, :update, :destroy]
        before_action :default_breadcrumb
        
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Banners", naturesoft.admin_banner_types_path
          add_breadcrumb "Banner Types", naturesoft.admin_banner_types_path
        end
    
        # GET /banner_types
        def index
          @banner_types = BannerType.all.paginate(:page => params[:page], :per_page => 10)
        end
    
        # GET /banner_types/1
        def show
        end
    
        # GET /banner_types/new
        def new
          @banner_type = BannerType.new
          add_breadcrumb "New Banner Type", nil,  class: "active"
        end
    
        # GET /banner_types/1/edit
        def edit
          add_breadcrumb "Edit Banner Type", nil,  class: "active"
        end
    
        # POST /banner_types
        def create
          add_breadcrumb "New Banner Type", nil,  class: "active"
          @banner_type = BannerType.new(banner_type_params)
          
          @banner_type.user = current_user
    
          if @banner_type.save
            redirect_to naturesoft.edit_admin_banner_type_path(@banner_type.id), notice: 'Banner type was successfully created.'
          else
            render :new
          end
        end
    
        # PATCH/PUT /banner_types/1
        def update
          add_breadcrumb "Edit Banner Type", nil,  class: "active"
          
          if @banner_type.update(banner_type_params)
            redirect_to naturesoft.edit_admin_banner_type_path(@banner_type.id), notice: 'Banner type was successfully updated.'
          else
            render :edit
          end
        end
    
        # DELETE /banner_types/1
        def destroy
          @banner_type.destroy
          redirect_to naturesoft.admin_banner_types_url, notice: 'Banner type was successfully destroyed.'
        end
    
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_banner_type
            @banner_type = BannerType.find(params[:id])
          end
    
          # Only allow a trusted parameter "white list" through.
          def banner_type_params
            params.require(:banner_type).permit(:name, :width, :height, :user_id)
          end
      end
    end
  end
end
