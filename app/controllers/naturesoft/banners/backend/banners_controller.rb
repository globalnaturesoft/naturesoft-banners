module Naturesoft
  module Banners
    module Backend
      class BannersController < Naturesoft::Backend::BackendController
        before_action :set_banner, only: [:show, :edit, :update, :enable, :disable, :destroy]
        before_action :default_breadcrumb
        
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Banner", naturesoft_banners.backend_banners_path
          add_breadcrumb "Banners", naturesoft_banners.backend_banners_path
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
          @banner = Banner.new(banner_params)
          @banner.user = current_user
    
          if @banner.save
            redirect_to naturesoft_banners.edit_backend_banner_path(@banner.id), notice: 'Banner was successfully created.'
          else
            render :new
          end
        end
    
        # PATCH/PUT /banners/1
        def update
          if @banner.update(banner_params)
            redirect_to naturesoft_banners.edit_backend_banner_path(@banner.id), notice: 'Banner was successfully updated.'
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
        
        # GET /banners/select2
        def select2
          render json: Banner.select2(params)
        end
    
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_banner
            @banner = Banner.find(params[:id])
          end
    
          # Only allow a trusted parameter "white list" through.
          def banner_params
            params.fetch(:banner, {}).permit(:image_url, :name, :link_url, :description, :status, :category_id)
          end
      end
    end
  end
end