require 'rails_helper'

feature 'table', type: :feature do
  let(:user) { create(:user) }

  scenario 'テーブルを作成できること' do
    # 未ログイン時はログイン画面に遷移する
    visit root_path
    expect(current_path).to eq new_user_session_path
  end
end