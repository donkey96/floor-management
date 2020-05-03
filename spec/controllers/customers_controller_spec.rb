require 'rails_helper'

describe CustomersController, type: :controller do
  let(:user) { create(:user) }
  let(:customer) { create(:customer) }
  let(:table) { create(:table) }

  describe 'GET #new' do

    context 'ログインしている場合' do
      before do

      end

      it 'new.html.hamlに遷移すること' do

      end
    end

    context 'ログインしていない場合' do
      before do

      end

      it "ログイン画面にリダイレクトすること" do

      end
    end
  end
  
end