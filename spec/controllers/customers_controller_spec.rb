require 'rails_helper'

describe CustomersController, type: :controller do
  let(:user) { create(:user) }
  let(:customer) { create(:customer) }
  let(:table) { create(:table) }

  describe 'GET #new' do

    context 'ログインしている場合' do
      before do
        login user
        get :new
      end

      it 'new.html.hamlに遷移すること' do
        expect(response).to render_template :new
      end
    end

    context 'ログインしていない場合' do
      before do
        get :new
      end

      it "ログイン画面にリダイレクトすること" do
      expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
  
end