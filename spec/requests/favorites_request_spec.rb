require 'rails_helper'

RSpec.describe "Favorites", type: :request do
  let(:user) { create(:user) }
  let(:other_user) { create(:other_user) }
  let(:micropost) { create(:micropost, user: user) }
  let(:favorite) { Favorite.create( user_id: user.id, micropost_id: micropost.id) }

  describe 'お気に入り' do
    before do
      sign_in user
    end

    describe '登録' do
      it 'お気に入り登録' do
        expect { post favorites_path , params: { user_id: user.id ,micropost_id: micropost.id}}.to change(Micropost, :count).by(1)
        expect(response.status).to eq 302
      end
    end
  end
end
