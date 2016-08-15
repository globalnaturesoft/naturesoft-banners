module Naturesoft
  module Banners
    module Admin
      class BannersController < Naturesoft::Admin::AdminController
        before_action :set_banner, only: [:show, :edit, :update, :enable, :disable, :destroy]
        before_action :default_breadcrumb
        
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Banners", naturesoft_banners.admin_banners_path
          add_breadcrumb "Banners", naturesoft_banners.admin_banners_path
        end
    
        # GET /banners
        def index
          @banners = Banner.search(params).paginate(:page => params[:page], :per_page => Naturesoft::Option.get("banners", "items_per_page"))
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
            redirect_to naturesoft_banners.edit_admin_banner_path(@banner.id), notice: 'Banner was successfully created.'
          else
            render :new
          end
        end
    
        # PATCH/PUT /banners/1
        def update
          add_breadcrumb "Edit Banner", nil,  class: "active"
          if @banner.update(banner_params)
            redirect_to naturesoft_banners.edit_admin_banner_path(@banner.id), notice: 'Banner was successfully updated.'
          else
            render :edit
          end
        end
    
        # DELETE /banners/1
        def destroy
          @banner.destroy
          render text: 'Banner was successfully destroyed.'
        end
        
        #CHANGE STATUS /banners
        def enable
          @banner.enable
          render text: 'Banner was successfully active.'
        end
        
        def disable
          @banner.disable
          render text: 'Banner was successfully inactive.'
        end
        
        # DELETE /banners/delete?ids=1,2,3
        def delete
          @banners = Banner.where(id: params[:ids].split(","))
          @banners.destroy_all
          render text: 'Banner(s) was successfully destroyed.'
        end
    
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_banner
            @banner = Banner.find(params[:id])
          end
    
          # Only allow a trusted parameter "white list" through.
          def banner_params
            params.fetch(:banner, {}).permit(:image_url, :name, :link_url, :description, :status)
          end
      end
    end
  end
end