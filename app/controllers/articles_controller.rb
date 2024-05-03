class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]
  rescue_from ActiveRecord::RecordNotFound, with: :article_not_found

  # GET /articles or /articles.json
  def index
    @articles = Article.all.page(params[:page]).per(8)
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to article_url(@article), notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy!

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully deleted." }
      format.json { head :no_content }
    end
  end

  #how to  Implement next operations for the Article model in the Ruby on Rails backend - GET a specific article by ID,  UPDATE an existing article by ID, and DELETE an article by ID. 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :body, :published)
    end

  def article_not_found
    respond_to do |format|
      format.html { redirect_to articles_url, alert: 'Article not found.' }
      format.json { render json: { error: 'Article not found' }, status: :not_found }
    end
  end

end
