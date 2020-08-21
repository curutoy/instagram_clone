require 'rails_helper'

RSpec.describe Micropost, type: :model do
    let(:micropost) {FactoryBot.build(:micropost)}
  
  describe "バリデーション" do
    it '全て条件が揃っていればOK' do
      expect(micropost).to be_valid
    end
    describe 'user_id' do
      it 'user_idがからの場合NG' do
        micropost.user_id = nil
        expect(micropost).to be_invalid
      end
    end
    
    describe 'content' do
      it 'contentが空である場合NG' do
        micropost.content = ' '
        expect(micropost).to be_invalid
      end
      
      it 'contentが140文字以上の場合NG' do
        micropost.content = 'a' * 141
        expect(micropost).to be_invalid
      end
    end
    
    describe 'image' do
      it 'imageが空の場合NG' do
        micropost.image = nil
        expect(micropost).to be_invalid
      end
    end
  end
end
