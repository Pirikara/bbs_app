require 'rails_helper'

feature 'user', type: :feature do
  let(:user) { create(:user) }

  scenario 'ログイン処理の統合テスト' do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    find('.send-btn').click
    expect(current_path).to eq root_path
  end

  scenario '新規登録処理の統合テスト' do
    expect {
      visit new_user_registration_path
      fill_in 'user[name]', with: 'テスト'
      fill_in 'user[email]', with: 'xyz@example.com'
      fill_in 'user[password]', with: '1a1a1a'
      fill_in 'user[password_confirmation]', with: '1a1a1a' 
      find('.send-btn').click
    }.to change(User, :count).by(1)
  end

  scenario 'ユーザー編集機能の統合テスト' do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    find('.send-btn').click
    expect(current_path).to eq root_path

    click_link('MYPAGE')
    expect(current_path).to eq user_path(7)
    click_link('EDIT ACCOUNT')
    expect(current_path).to eq edit_user_registration_path
    fill_in 'user[name]', with: 'AIUEO'
    fill_in 'user[email]', with: 'xyz@example.com'
    fill_in 'user[password]', with: '1b1b1b'
    fill_in 'user[password_confirmation]', with: '1b1b1b'
    fill_in 'user[current_password]', with: '1a1a1a'
    find('.send-btn-a').click
    expect(current_path).to eq root_path
    click_link('MYPAGE')
    expect(page).to have_content('AIUEO')
  end

end