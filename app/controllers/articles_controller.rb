class ArticlesController < ApplicationController
  protect_from_forgery with: :exception, unless: -> { request.format.json? }
  before_action :set_article, only: %i[ show edit update destroy ]
  rescue_from ActiveRecord::RecordNotFound, with: :article_not_found

  def index
    @articles = Article.all.page(params[:page]).per(15)
  end

  def new
    @article = Article.new
  end

  # GET /articles/1 or /articles/1.json
  def show
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

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    @article = Article.find(params[:id])

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
    @article = Article.find(params[:id])
    @article.destroy!

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully deleted." }
      format.json { head :no_content }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :body, :published)
    end

  def article_not_foundrails s
    respond_to do |format|
      format.html { redirect_to articles_url, alert: 'Article not found.' }
      format.json { render json: { error: 'Article not found' }, status: :not_found }
    end
  end

end
