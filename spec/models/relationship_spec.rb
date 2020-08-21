require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:relationship) { FactoryBot.build(:relationship) }
  
  describe 'バリデーション' do
    it '全て条件が揃っていればOK' do
      expect(relationship).to be_valid
    end
    
    it 'followerが空だとNG' do
      relationship.follower_id = nil
      expect(relationship).to be_invalid
    end
    
    it 'followedが空だとNG' do
      relationship.followed_id = nil
      expect(relationship).to be_invalid
    end
    
    it '重複はNG' do
      relationship.save
      dup = relationship.dup
      expect { dup.save }.to raise_error ActiveRecord::RecordNotUnique
    end
  end
end
