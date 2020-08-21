require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) {FactoryBot.build(:comment)}
  
  describe 'バリデーション' do
    it '全ての条件が揃った場合OK' do
      expect(comment).to be_valid
    end
    
    it 'user_idが空の場合NG' do
      comment.user_id = nil
      expect(comment).to be_invalid
    end
    
    it 'micropost_idが空の場合NG' do
      comment.micropost_id = nil
      expect(comment).to be_invalid
    end
    
    it 'textが空の場合NG' do
      comment.text = ' '
      expect(comment).to be_invalid
    end
  end
end
