require 'rails_helper'

RSpec.describe "Microposts", type: :request do
  let(:user) { create(:user) }
  before do
    sign_in user
  end
  describe '投稿ページ' do
    it 'リクエスト成功' do
      get new_micropost_path user
      expect(response.status).to eq 200
    end
    
    it 'newテンプレートで表示されること' do
      get new_micropost_path user
      expect(response).to render_template :new
    end
  end
  
  describe '投稿' do
      it '投稿成功' do
        expect do
        post '/microposts', params: { micropost:{ 
                                       content: "example" ,
                                       image: Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/example.jpg"), 'image/jpg') } }
        end.to change(Micropost, :count).by(1)
        expect(response.status).to eq 302
      end
    
    it '投稿失敗' do
     expect do
      post '/microposts', params: { micropost:{ 
                                     content: " " ,
                                     image: Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/example.jpg"), 'image/jpg') } }
      end.not_to change(Micropost, :count)
    end
  end
  
  describe '投稿一覧' do
    it 'リクエスト成功' do
      get root_path
      expect(response.status).to eq 200
    end
    
     it 'indexテンプレート' do
      get root_path
      expect(response).to render_template :index
    end
  end
  
  describe '投稿削除' do
    it 'リクエスト成功' do
      delete '/microposts/:id'
      expect(response.status).to eq 302
    end
    
    it '投稿が削除されること' do
      post '/microposts', params: { micropost:{ 
                                       content: "example" ,
                                       image: Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/example.jpg"), 'image/jpg') } }
      expect { delete '/microposts/1' }.to change(Micropost, :count).by(-1)
    end
    
    it '投稿一覧リダイレクトすること' do
      delete '/microposts/:id'
      expect(response).to redirect_to(root_path)
    end
  end
end
