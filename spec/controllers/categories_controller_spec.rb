require 'rails_helper'

describe CategoriesController, type: :controller do
  describe 'GET #show' do
    it 'カテゴリ詳細ページへアクセスできる' do
      get :show, params: {  id: 1 }
      expect(response).to render_template :show, params: { id: 1 } 
    end
  end
end