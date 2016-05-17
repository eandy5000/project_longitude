class ArticlesController < ApplicationController
    def new
        @article = Article.new
    end
    def create
        @article = Article.new(article_params)
        #hard coded user 
        @article.user = User.first
        if @article.save
            flash[:notice]="Article was saved"
            redirect_to articles_path(@article)
        else
            render 'new'    
        end
    end
    
    def show
        @article = Article.find(params[:id])
    end    
    
    def edit
        @article = Article.find(params[:id])
    end
    
    def update
        @article = Article.find(params[:id])
        
        if @article.update(article_params)
            flash[:notice] = "Article Successfully Updated"
            redirect_to article_path(@article)
        else    
            render 'edit'
        end
    end
    
    def index
        # this is plural @articles_path
        @articles = Article.all
    end
    
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        flash[:notice] = "Article was deleted"
        redirect_to articles_path
    end
    
    
    
private
    def article_params
    #gets title and description
    params.require(:article).permit(:title, :description)
    end
    
end
