require 'rails_helper'

RSpec.describe "Comments", type: :request do
  let(:user)      { create(:user) }
  let(:micropost) { create(:micropost, user: user) }
  
  before do
    sign_in user
  end
  
  describe 'コメント' do
    describe '投稿' do
      
      it '投稿成功' do
        expect do
          post  micropost_comments_path micropost , params: { comment:{ text: "comment" }}
        end.to change(Comment, :count).by(1) 
        expect(response.status).to eq 302
      end
      
      it '投稿失敗' do
        expect do
          post  micropost_comments_path micropost , params: { comment:{ text: " " }}
        end.not_to change(Comment, :count)
      end
    end
  end
end
