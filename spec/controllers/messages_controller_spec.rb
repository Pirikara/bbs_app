require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  let(:room) { create(:room) }
  let(:params){{ room_id: room.id, user_id: user.id, message: attributes_for(:message) }}

  describe 'POST #create' do
    context 'ログインしている場合' do
      before do
        login user
      end

      context '保存ができる' do
        subject {
          post :create,
          params: params
        }
        it "メッセージが送信できる" do
          expect{ subject }.to change(Message, :count).by(1)
        end

        it "詳細画面がレンダーされる" do
          subject
          expect(response).to redirect_to(room_path(room.id))
        end
      end

      context '保存できない' do
        let(:invalid_params){{room_id: room.id, user_id: user.id, message: attributes_for(:message, content: nil) }}
        subject {
          post :create,
          params: invalid_params
        }

        it '保存できない' do
          expect{ subject }.not_to change(Message, :count)
        end

        it '詳細画面がレンダーされる' do
          subject
          expect(response).to render_template :show, parmas: {id: room.id}
        end
      end
    end

    context 'ログインしていない場合' do
      it 'サインイン画面にリダイレクトされる' do
        post :create, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end

  end
end