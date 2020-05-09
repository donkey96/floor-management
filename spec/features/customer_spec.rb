require 'rails_helper'

feature 'table', type: :feature do
  let(:user) { create(:user) }
  let(:table) { create(:table) }
  let(:customer) { create(:customer) }

  scenario 'customer情報を更新できる' do
    # 未ログイン時はログイン画面に遷移
    visit customers_path
    expect(current_path).to eq new_user_session_path
  end
end