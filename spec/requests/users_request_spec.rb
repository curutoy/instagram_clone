require 'rails_helper'
RSpec.describe "Users", type: :request do
  describe 'users_path' do
    let(:user)  { FactoryBot.build(:user) }
    before do
      sign_in user
      FactoryBot.create :other_user
      FactoryBot.create :other_user2
    end
    
    it 'リクエストが成功' do
      get users_path
      expect(response).to have_http_status(200)
    end
    
    it 'indexテンプレート' do
      get users_path
      expect(response).to render_template :index
    end
    
    it '名前表示' do
      get users_path
      expect(response.body).to include "Other User"
      expect(response.body).to include "Other User2"
    end
  end
end
