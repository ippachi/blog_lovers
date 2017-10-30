require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe 'GET #index' do
    let(:user) { create(:user, :with_articles) }
    let(:articles) { user.articles }
    before do
      get :index, params: { user_screen_name: user.screen_name }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'assigns @articles' do
      expect(assigns(:articles)).to match_array articles
    end

    it 'render index' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    let(:article) { create(:article, :with_user) }
    let(:user) { article.user }
    before do
      get :show, params: { user_screen_name: user.screen_name, id: article }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'assigns @article' do
      expect(assigns(:article)).to eq article
    end

    it 'render show' do
      expect(response).to render_template :show
    end
  end
end
