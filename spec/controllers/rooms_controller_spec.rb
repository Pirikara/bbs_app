require 'rails_helper'

describe RoomsController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #new' do
    context 'log in' do
      before do
        login user
      end
      it "投稿ページを表示する" do
        get :new
        expect(response).to render_template :new
      end
    end
    context 'not log in' do
      it 'ログインしていない場合、トップページにリダイレクトされる' do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

end