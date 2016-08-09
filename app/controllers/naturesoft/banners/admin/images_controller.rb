module Naturesoft
  module Banners
    module Admin
      class ImagesController < Naturesoft::Admin::AdminController
        before_action :set_image, only: [:show, :edit, :update, :enable, :disable, :destroy]
        before_action :default_breadcrumb
        
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Banners", naturesoft_banners.admin_images_path
          add_breadcrumb "Images", naturesoft_banners.admin_images_path
        end
    
        # GET /images
        def index
          @images = Image.search(params).paginate(:page => params[:page], :per_page => 10)
        end
    
        # GET /images/1
        def show
        end
    
        # GET /images/new
        def new
          @image = Image.new
          add_breadcrumb "New Image", nil, class: "active"
        end
    
        # GET /images/1/edit
        def edit
          add_breadcrumb "Edit Image", nil, class: "active"
        end
    
        # POST /images
        def create
          add_breadcrumb "New Image", nil, class: "active"
          @image = Image.new(image_params)
          @image.user = current_user
    
          if @image.save
            redirect_to naturesoft_banners.edit_admin_image_path(@image.id), notice: 'Image was successfully created.'
          else
            render :new
          end
        end
    
        # PATCH/PUT /images/1
        def update
          add_breadcrumb "Edit Image", nil, class: "active"
          
          if @image.update(image_params)
            redirect_to naturesoft_banners.edit_admin_image_path(@image.id), notice: 'Image was successfully updated.'
          else
            render :edit
          end
        end
    
        # DELETE /images/1
        def destroy
          @image.destroy
          render text: 'Image was successfully destroyed.'
        end
        
        #CHANGE STATUS /images
        def enable
          @image.enable
          render text: 'Image was successfully active.'
        end
        
        def disable
          @image.disable
          render text: 'Image was successfully inactive.'
        end
    
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_image
            @image = Image.find(params[:id])
          end
    
          # Only allow a trusted parameter "white list" through.
          def image_params
            params.fetch(:image, {}).permit(:image_type, :name, :width, :height, :status)
          end
      end
    end
  end
end