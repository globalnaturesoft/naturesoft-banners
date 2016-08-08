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
          @banners = Banner.search(params).paginate(:page => params[:page], :per_page => 10)
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
        
        # enable banner status
        def enable
          @banner.status = "active"
          @banner.save
          render text: 'Banner was successfully active.'
        end
        
        # disable banner status
        def disable
          @banner.status = "inactive"
          @banner.save
          render text: 'Banner was successfully inactive.'
        end
    
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_banner
            @banner = Banner.find(params[:id])
          end
    
          # Only allow a trusted parameter "white list" through.
          def banner_params
            params.fetch(:banner, {}).permit(:image_url, :name, :link_url, :description, :banner_type_id, :user_id, :status)
          end
      end
    end
  end
end