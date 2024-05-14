class ArticlesController < ApplicationController
 def index
  @articles = Article.all
 end

 def create
  @article = Article.new(article_params)
  if @article.save
    redirect_to article_path(@article)
  else
    render 'new'
  end
 end


 def destroy
  @article = Article.find(params[:id])
  @article.destroy
  # No need for app/views/articles/destroy.html.erb
  redirect_to articles_path, status: :see_other
 end

 def new
    @article = Article.new # Needed to instantiate the form_with
 end

 def edit
  @article = Article.find(params[:id])
 end

 def show
   @article = Article.find(params[:id])
 end

 def update
  @article = Article.find(params[:id])
  @article.update(article_params)
  redirect_to article_path(@article)
 end

private

def article_params
  params.require(:article).permit(:title, :content)
end
end
