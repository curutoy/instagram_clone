require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }
  
  describe 'バリデーション' do
    it '全て条件が揃っていればOK' do
      expect(user).to be_valid
    end
    
    describe 'user_name' do
      it 'user_nameが空だとNG' do
        user.user_name = ''
        expect(user).to be_invalid
      end 
      
      it 'user_nameが21文字以上だとNG' do
         user.user_name = "a" * 21
         expect(user).to be_invalid
      end
    end
    
    describe 'name' do
      it 'nameが空だとNG' do
        user.name = ''
        expect(user).to be_invalid
      end
      
       it 'nameが21文字以上だとNG' do
         user.name = "a" * 21
         expect(user).to be_invalid
      end
    end
    
    describe 'email' do
      it 'emailが空だとNG' do
        user.email = ''
        expect(user).to be_invalid
      end
      
      it 'emailが61文字以上だとNG' do
         user.email = "a" * 61
         expect(user).to be_invalid
      end
      
      it 'emailの型が正しければOK' do
        valid_addresses = %w[user@example.com User@example.COM User_A-B@example.com 
                          user.a@example.com user+a@example.com]
        valid_addresses.each do |valid_address|
          user.email = valid_address
          expect(user).to be_valid
        end
      end
      
      it 'emailの型が正しくなければNG' do
        invalid_addresses = %w[user@example,com user_a_exampale.com user@example. 
                          user@exam_ple.com user@exam+ple.com]
        invalid_addresses.each do |invalid_address|
          user.email = invalid_address
          expect(user).to be_invalid
        end
      end
      
      it 'emailが重複した場合NG' do
        duplicate_user = user.dup
        user.save
        expect(duplicate_user).to be_invalid
      end
    end
    
    describe 'password' do
      it 'passwordが空だとNG' do
        user.password = ''
        expect(user).to be_invalid
      end
      
      it 'passwordが6文字以下だとNG' do
        user.password = "a" * 5
        expect(user).to be_invalid
      end
    end
  end
end
