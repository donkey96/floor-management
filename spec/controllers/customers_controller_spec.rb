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
  
  describe 'GET #index' do
    context 'ログインしている場合' do
    before do
      login user
      get :index, params: {}
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

  describe "POST #create" do

    context "ログインしている場合" do
      before do
      login user
      end
  
      context "保存に成功した場合" do

        it "customerを保存すること" do
        
        end

        it "root_pathにリダイレクトすること" do
        
        end
      end

      context "保存に失敗した場合" do

        it "customerを保存しないこと" do

        end

        it "new.html.hamlに遷移すること" do
        
        end
      end
    end
    
    context "ログインしていない場合" do
      
      it "ログイン画面にリダイレクトすること" do
        post :create
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end