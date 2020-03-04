require 'rails_helper'

feature 'message', type: :feature do
  let(:user) { create(:user) }
  let(:room) { create(:room) }

  scenario 'メッセージ送信の統合テスト' do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    find('.send-btn').click
    expect(current_path).to eq root_path
    
    click_link('CREATE ROOM')
    expect(current_path).to eq new_room_path
    find('#room_image').click
    attach_file "room[image]", "app/assets/images/default.jpg"
    fill_in 'room[title]', with: "テスト"
    fill_in 'room[description]', with: "テストです"
    check 'アニメ・漫画'
    find('.send-btn').click
    expect(current_path).to eq room_path(id: 8)

    expect {
      fill_in 'message[content]', with: "テスト投稿"
      find('#message-send').click
    }.to change(Message, :count).by(1)
  end
end