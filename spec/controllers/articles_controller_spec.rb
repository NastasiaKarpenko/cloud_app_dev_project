require 'rails_helper'


RSpec.describe ArticlesController, type: :controller do

    describe "GET #index" do
    it "assigns @articles and renders the index template" do
      article = create(:article)
      get :index
      expect(assigns(:articles)).to eq([article])
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "assigns the requested article to @article" do
      article = create(:article)
      get :show, params: { id: article.id }
      expect(assigns(:article)).to eq(article)
    end

    it "renders the show template" do
      article = create(:article)
      get :show, params: { id: article.id }
      expect(response).to render_template("show")
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new article" do
        expect {
          post :create, params: { article: attributes_for(:article) }
        }.to change(Article, :count).by(1)
      end

      it "redirects to the new article" do
        post :create, params: { article: attributes_for(:article) }
        expect(response).to redirect_to(Article.last)
      end
    end

    context "with invalid attributes" do
      it "does not save the new article" do
        expect {
          post :create, params: { article: attributes_for(:article, title: nil) }
        }.to_not change(Article, :count)
      end

      it "re-renders the new method" do
        post :create, params: { article: attributes_for(:article, title: nil) }
        expect(response).to render_template("new")
      end
    end

describe "GET #edit" do
    it "assigns the requested article to @article" do
        article = create(:article)
        get :edit, params: { id: article.id }
        expect(assigns(:article)).to eq(article)
    end

    it "renders the edit template" do
        article = create(:article)
        get :edit, params: { id: article.id }
        expect(response).to render_template("edit")
    end
end

describe "PATCH #update" do
    context "with valid attributes" do
        it "updates the requested article" do
            article = create(:article)
            patch :update, params: { id: article.id, article: { title: "New Title" } }
            article.reload
            expect(article.title).to eq("New Title")
        end

        it "redirects to the updated article" do
            article = create(:article)
            patch :update, params: { id: article.id, article: { title: "New Title" } }
            expect(response).to redirect_to(article)
        end
    end

    context "with invalid attributes" do
        it "does not update the article" do
            article = create(:article)
            patch :update, params: { id: article.id, article: { title: nil } }
            article.reload
            expect(article.title).not_to be_nil
        end

        it "re-renders the edit method" do
            article = create(:article)
            patch :update, params: { id: article.id, article: { title: nil } }
            expect(response).to render_template("edit")
        end
    end
end

describe "DELETE #destroy" do
    it "destroys the requested article" do
        article = create(:article)
        expect {
            delete :destroy, params: { id: article.id }
        }.to change(Article, :count).by(-1)
    end

    it "redirects to the articles index" do
        article = create(:article)
        delete :destroy, params: { id: article.id }
        expect(response).to redirect_to(articles_url)
    end
end
end
