class CategoriesController < ApplicationController
    def index
        @categories = Category.all
    end
    
    def new
        @category = Category.new
    end
    
    def show
    end 
    
    def create
    #category_params is white listing
        @category = Category.new(category_params)
        if @category.save
            flash[:success] = "category was created"
            redirect_to categories_path
        else
            render 'new'
        end
    end
    
    private
    
    def category_params
        params.require(:category).permit(:name)
    end
    
end