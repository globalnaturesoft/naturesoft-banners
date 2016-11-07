module Naturesoft
  module Banners
    module Backend
      class CategoriesController < Naturesoft::Backend::BackendController
        before_action :set_category, only: [:show, :edit, :update, :destroy, :enable, :disable]
        before_action :default_breadcrumb
        
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Banner", naturesoft_banners.backend_banners_path
          add_breadcrumb "Categories", naturesoft_banners.backend_categories_path
        end
    
        # GET /categories
        def index
          @categories = Category.search(params).paginate(:page => params[:page], :per_page => 10)
        end
    
        # GET /categories/1
        def show
        end
    
        # GET /categories/new
        def new
          @category = Category.new
          add_breadcrumb "New Category", nil,  class: "active"
        end
    
        # GET /categories/1/edit
        def edit
          add_breadcrumb "New Category", nil,  class: "active"
        end
    
        # POST /categories
        def create
          @category = Category.new(category_params)
          @category.user = current_user
    
          if @category.save
            redirect_to naturesoft_banners.edit_backend_category_path(@category.id), notice: 'Category was successfully created.'
          else
            render :new
          end
        end
    
        # PATCH/PUT /categories/1
        def update
          if @category.update(category_params)
            redirect_to naturesoft_banners.edit_backend_category_path(@category.id), notice: 'Category was successfully updated.'
          else
            render :edit
          end
        end
    
        # DELETE /categories/1
        def destroy
          @category.destroy
          render text: 'Category was successfully destroyed.'
        end
        
        #CHANGE STATUS /categories
        def enable
          @category.enable
          render text: 'Category was successfully active.'
        end
        
        def disable
          @category.disable
          render text: 'Category was successfully inactive.'
        end
        
        # DELETE /categories/delete?ids=1,2,3
        def delete
          @categories = Category.where(id: params[:ids].split(","))
          @categories.destroy_all
          render text: 'Categor(y/ies) was successfully destroyed.'
        end
        
        # GET /categories/select2
        def select2
          render json: Category.select2(params)
        end
    
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_category
            @category = Category.find(params[:id])
          end
    
          # Only allow a trusted parameter "white list" through.
          def category_params
            params.fetch(:category, {}).permit(:name, :width, :height, :image_scale)
          end
      end
    end
  end
end