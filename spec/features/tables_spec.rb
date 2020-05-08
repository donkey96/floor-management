require 'rails_helper'

feature 'table', type: :feature do
  let(:user) { create(:user) }
  let(:table) { create(:table) }

  scenario 'テーブル情報を更新できる' do
    # 未ログイン時はログイン画面に遷移する
    visit root_path
    expect(current_path).to eq new_user_session_path

    # ログイン処理
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path

    # テーブルの作成
    expect {
      click_link('テーブル登録')
      expect(current_path).to eq new_table_path
      fill_in 'name', with: 'テスト用テーブル'
      find('input[type="submit"]').click
    }.to change(Table, :count).by(1)
    expect(current_path).to eq root_path

    #テーブルを削除
    visit root_path
    expect{
      click_link('テーブル削除')
    }.to change(Table, :count).by(-1)
    expect(current_path).to eq root_path

  end
end