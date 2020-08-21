require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let(:favorite) {FactoryBot.build(:favorite)}
  
  describe 'バリデーション' do
    it 'すべての条件が揃った場合OK' do
      expect(favorite).to be_valid
    end
    
    it 'user_idが空の場合NG' do
      favorite.user_id = nil
      expect(favorite).to be_invalid
    end
    
    it 'micropost_idが空の場合NG' do
      favorite.micropost_id = nil
      expect(favorite).to be_invalid
    end
  end
end
