require 'rails_helper'

RSpec.describe "Relationships", type: :request do
  let(:user) { create(:user) }
  let(:other_user) { create(:other_user) }
  let(:relationship) { Relationship.create(follower_id: user.id, followed_id: other_user.id) }
  
before do
  sign_in user
end
  
  describe 'フォロー機能' do
    it 'フォローする' do
      expect { post relationships_path, params: { followed_id: other_user.id } }.to change { user.following.count }.by(1)
    end
    
    it 'フォロー解除' do
      relationship
      expect { delete relationship_path(relationship) }.to change { user.following.count }.by(-1)
    end
  end
end
