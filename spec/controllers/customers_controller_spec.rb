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
    let(:params) { { user_id: user.id, table_ids: table.id, customer: attributes_for(:customer)}}

    context "ログインしている場合" do
      before do
      login user
      end
  
      context "保存に成功した場合" do
        subject {
          post :create,
          params: params
        }

        it "customerを保存すること" do
          expect{ subject }.to change(Customer, :count).by(1)
        end

        it "root_pathにリダイレクトすること" do
          subject
          expect(response).to redirect_to(root_path)
        end
      end

      context "保存に失敗した場合" do
        let(:invalid_params) { {  user_id: user.id, table_ids: table.id, customer: attributes_for(:customer, name: nil, tel: nil) } }

        subject {
          post :create,
          params: invalid_params
        }

        it "customerを保存しないこと" do
          expect{ subject }.not_to change(Customer, :count)
        end

        it "new_customer_pathにリダイレクトすること" do
          subject
          expect(response).to redirect_to(new_customer_path)
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

  context "GET #edit" do

    context "ログインしている場合" do
      before do
        login user
      end
      it "`customerに正しい値が入っていること" do
      
      end

      it "edit.html.hamlに遷移すること" do
      
      end
    end

    context "ログインしていない場合" do
      before do
        customer = create(:customer)
        get :edit,
        params: { id: customer }
      end
    
      it "ログイン画面にリダイレクトすること" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end