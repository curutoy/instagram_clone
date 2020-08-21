require 'rails_helper'

RSpec.describe "UserAuthentications", type: :request do
  let(:user) { create(:user) }
  let(:user_params) { attributes_for(:user) }
  let(:invalid_user_params) { attributes_for(:user, name: "") }
  
  describe 'ユーザー登録画面' do
    it 'リクエスト成功' do
      get new_user_registration_path
      expect(response.status).to eq 200
    end
    
    it 'newテンプレートで表示されること' do
      get new_user_registration_path
      expect(response).to render_template :new
    end
  end
  
  describe 'ユーザー登録' do
    context 'パラメーターが妥当な場合' do
      it 'リクエスト成功' do
        post user_registration_path, params: { user: user_params }
        expect(response.status).to eq 302
      end
      
      it 'ユーザー登録成功' do
        expect do
          post user_registration_path, params: { user: user_params }
        end.to change(User, :count).by 1
      end
      
      it 'リダイレクト' do
        post user_registration_path, params: { user: user_params }
        expect(response).to redirect_to User.last
      end
    end
    
    context 'パラメーターが不正' do
      it 'リクエストが成功すること' do
        post user_registration_path, params: { user: invalid_user_params }
        expect(response.status).to eq 200
      end
      
      it 'ユーザー登録失敗' do
        expect do
          post user_registration_path, params: { user: invalid_user_params }
        end.not_to change(User, :count)
      end
      
      it 'newテンプレートで表示されること' do
        post user_registration_path, params: { user: invalid_user_params }
        expect(response).to render_template :new
      end
      
      it 'エラーが表示されること' do
        post user_registration_path, params: { user: invalid_user_params }
        expect(assigns(:user).errors.any?).to be_truthy
      end
    end
  end
  
  describe 'ユーザー編集画面' do
    before do
      sign_in user
    end
    it 'リクエスト成功' do
      get edit_user_registration_path user
      expect(response.status).to eq 200
    end
    
    it '名前が表示されていること' do
      get edit_user_registration_path user
      expect(response.body).to include 'example'
    end
    
    it 'ユーザー名が表示されていること' do
      get edit_user_registration_path user
      expect(response.body).to include 'Example User'
    end
    
    it 'emailアドレスが表示されている' do
      get edit_user_registration_path user
      expect(response.body).to include 'example@example.com'
    end
  end
  
  describe 'ユーザー削除' do
    before do
      sign_in user
    end
    it 'リクエスト成功' do
      delete '/users' 
      expect(response.status).to eq 302
    end
    
    it 'ユーザーが削除されること' do
      expect do
        delete '/users'
      end.to change(User, :count).by(-1)
    end
    
    it 'ユーザー一覧にリダイレクトすること' do
      delete '/users'
      expect(response).to redirect_to(root_path)
    end
  end
end