require 'rails_helper'

describe TablesController, type: :controller do
  let(:user) { create(:user) }
  let(:table) { create(:table) }

  describe 'GET #new' do
    context 'ログインしている場合' do
      before do
        login user
        get :new
      end
      it "new.html.hamlに遷移すること" do
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
  
  describe 'GET #index' do
    context 'ログインしている場合' do
      before do
        login user
        get :index
      end
      it "@tableに正しい値が入っていること" do
        tables = create_list(:table, 3)
        expect(assigns(:table)).to match(tables)
      end
    
      it "index.html.hamlに遷移すること" do
        expect(response).to render_template :index
      end
    end

    context 'ログインしていない場合' do
      before do
        get :index
      end
      it "ログイン画面にリダイレクトすること" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe '#create' do
    let(:params) { { user_id: user.id, table: attributes_for(:table) } }

    context 'ログインしている場合' do
      before do
       login user
      end

      context '保存に成功した場合' do

      end

      context '保存に失敗した場合' do

      end
    end

    context "ログインしていない場合" do

    end
  end
end