require 'rails_helper'
RSpec.describe "UsersLogins", type: :request do
  let!(:user) { FactoryBot.create(:user) }
  let!(:user_params) { FactoryBot.attributes_for(:user) }
  let(:invalid_user_params) { attributes_for(:user, user_name: "") }
  
  describe "ログイン" do
    it 'リクエスト成功' do
      get login_path
      expect(response.status).to eq 200
    end
    
    it 'ログインが成功' do
      post user_session_path, params: { user: user_params }
      expect(response).to redirect_to user_path user
    end
    
    it 'ログイン失敗' do
      get login_path
      post user_session_path, params: { user: invalid_user_params }
      expect(response.body).to include "ユーザー名またはパスワードが違います。"
    end
  end
  
  describe "ログアウト" do
    before do
        sign_in user
      end
    it "リダイレクト" do
      delete destroy_user_session_path
      expect(response).to redirect_to root_path
    end
  end
end
