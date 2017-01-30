class ArticlesController < ApplicationController
    
    def index
     @articles = Article.all
    # redirect_to article_path(@articles)
    end
    
    def new
     @article = Article.new
    end
    
    def edit
      @article = Article.find(params[:id])
    end
    
    def create
      #render plain: params[:article].inspect
      @article = Article.new(article_params)
      if @article.save
          flash[:notice] = "Article Successfully Created"
          redirect_to article_path(@article)
      else
        render :new
      end    
      
    end
    
    def update
      #render plain: params[:article].inspect
      @article=Article.find(params[:id])
      if @article.update(article_params)
          flash[:notice] = "Article Successfully Updated"
          redirect_to article_path(@article)
      else
        render :edit
      end
    end 
    
    def show
      @article=Article.find(params[:id])
    end
    
    def destroy
      @article=Article.find(params[:id])
      @article.destroy
      flash[:notice] = "Article Destroyed Redirecting to Articles List"
      redirect_to articles_path
    end
    
    
    private
    def article_params
      params.require(:article).permit(:title, :description)
    end
    
end
