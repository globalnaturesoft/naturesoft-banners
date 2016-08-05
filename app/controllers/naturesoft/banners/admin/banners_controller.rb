module Naturesoft
  module Banners
    module Admin
      class BannersController < Naturesoft::Admin::AdminController
        before_action :set_banner, only: [:show, :edit, :update, :destroy]
        before_action :default_breadcrumb
        
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Banners", naturesoft.admin_banners_path
          add_breadcrumb "Banners", naturesoft.admin_banners_path
        end
    
        # GET /banners
        def index
          @banners = Banner.all.paginate(:page => params[:page], :per_page => 10)
        end
    
        # GET /banners/1
        def show
        end
    
        # GET /banners/new
        def new
          @banner = Banner.new
          add_breadcrumb "New Banner", nil,  class: "active"
        end
    
        # GET /banners/1/edit
        def edit
          add_breadcrumb "Edit Banner", nil,  class: "active"
        end
    
        # POST /banners
        def create
          add_breadcrumb "New Banner", nil,  class: "active"
          @banner = Banner.new(banner_params)
          
          @banner.user = current_user
    
          if @banner.save
            redirect_to naturesoft.edit_admin_banner_path(@banner.id), notice: 'Banner was successfully created.'
          else
            render :new
          end
        end
    
        # PATCH/PUT /banners/1
        def update
          dd_breadcrumb "Edit Banner", nil,  class: "active"
          if @banner.update(banner_params)
            redirect_to naturesoft.edit_admin_banner_path(@banner.id), notice: 'Banner was successfully updated.'
          else
            render :edit
          end
        end
    
        # DELETE /banners/1
        def destroy
          @banner.destroy
          redirect_to naturesoft.admin_banners_url, notice: 'Banner was successfully destroyed.'
        end
    
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_banner
            @banner = Banner.find(params[:id])
          end
    
          # Only allow a trusted parameter "white list" through.
          def banner_params
            params.require(:banner).permit(:image_url, :name, :link_url, :description, :banner_type_id, :user_id)
          end
      end
    end
  end
end
