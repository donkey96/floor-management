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

  describe 'POST #create' do
    let(:params) { { user_id: user.id, table: attributes_for(:table) } }

    context 'ログインしている場合' do
      before do
       login user
      end

      context '保存に成功した場合' do
        subject {
          post :create,
          params: params
        }

        it 'tableを保存すること' do
          expect{ subject }.to change(Table, :count).by(1)
        end

        it 'root_pathへリダイレクトすること' do
          subject
          expect(response).to redirect_to(root_path)
        end
      end

      context '保存に失敗した場合' do
        let(:invalid_params) { { user_id: user.id, table: attributes_for(:table, name: nil) } }

        subject {
          post :create,
          params: invalid_params
        }

        it 'tableを保存しないこと' do
          expect{ subject }.not_to change(Table, :count)
        end

        it 'new_table_pathにリダイレクトすること' do
          subject
          expect(response).to redirect_to(new_table_path)
        end
      end
    end

    context "ログインしていない場合" do

      it "ログイン画面にリダイレクトすること" do
      post :create, params: params
      expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'DELETE #destroy' do

    context 'ログインしている場合' do
      before do
      login user
      end

      it 'テーブルを削除すること' do
        table = create(:table)
        expect{delete :destroy, params: {id: table.id}}.to change(Table, :count).by(-1)
      end

      it 'root_pathにリダイレクトすること' do
        delete :destroy, params: {id: table.id}
        expect(response).to redirect_to(root_path)
      end
    end

    context 'ログインしていない場合' do
    
      it 'ログイン画面にリダイレクトすること' do
         delete :destroy, params: {id: table.id}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

  end
end