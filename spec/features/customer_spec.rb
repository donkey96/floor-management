require 'rails_helper'

feature 'table', type: :feature do
  let(:user) { create(:user) }
  let(:table) { create(:table) }
  let(:customer) { create(:customer) }

  scenario 'customer情報を更新できる' do
    # 未ログイン時はログイン画面に遷移
    visit customers_path
    expect(current_path).to eq new_user_session_path

    # ログイン処理
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input[name="commit"]').click
    expect(current_path).to eq customers_path

    # 顧客登録
    expect {
      click_link('当日予約')
      expect(current_path).to eq new_customer_path
      fill_in 'customer_name', with: 'aaa'
      fill_in 'customer_people', with: '10'
      fill_in 'customer_tel', with: '12345678910'
      fill_in 'customer_day', with: '12345678'
      fill_in 'customer_time', with: '1234'
      fill_in 'customer_text', with: 'aaaaaaaaaaaaaaaa'
      find('input[type="submit"]').click
    }.to change(Customer, :count).by(1)
    expect(current_path).to eq root_path
  end
end