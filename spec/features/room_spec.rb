require 'rails_helper'

feature 'room', type: :feature do
  let(:user) { create(:user) }

  scenario '新規投稿の統合テスト' do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    find('.send-btn').click
    expect(current_path).to eq root_path

    expect {
      click_link('CREATE ROOM')
      expect(current_path).to eq new_room_path
      find('#room_image').click
      attach_file "room[image]", "app/assets/images/default.jpg"
      fill_in 'room[title]', with: "テスト"
      fill_in 'room[description]', with: "テストです"
      check 'アニメ・漫画'
      find('.send-btn').click
    }.to change(Room, :count).by(1)
  end

end