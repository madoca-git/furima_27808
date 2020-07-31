require 'rails_helper'

describe User do
  describe '#create' do
    # 1. nicknameとemail、passwordとpassword_confirmation、last_name、first_name、birthdayが存在すれば登録できること
    it 'is invalid without a nickname, email, password, password_confirmation, last_name, first_name, birthday' do
      # binding.pry
      user = build(:user)
      expect(user).to be_valid
    end

    # 2. nicknameが空では登録できないこと
    it 'is invalid without a nickname' do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include('を入力してください')
    end

    # 3. emailが空では登録できないこと
    it 'is invalid without an email' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include('を入力してください')
    end

    # 4. 重複したemailが存在する場合登録できないこと
    it 'is invalid with a duplicate email address' do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include('はすでに存在します')
    end

    # 5. passwordが空では登録できないこと
    it 'is invalid without a password' do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include('を入力してください')
    end

    # 6. passwordが存在してもpassword_confirmationが空では登録できないこと
    it 'is invalid without a password_confirmation although with a password' do
      user = build(:user, password_confirmation: '')
      user.valid?
      expect(user.errors[:password_confirmation]).to include('とパスワードの入力が一致しません')
    end

    # 7. passwordが5文字以下であれば登録できないこと
    it 'is invalid with a password that has less than 5 characters ' do
      user = build(:user, password: '00000')
      user.valid?
      expect(user.errors[:password]).to include('は6文字以上で入力してください')
    end

    # 8. last_nameが空では登録できないこと
    it 'is invalid without a last_name' do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include('を入力してください')
    end

    # 9. first_nameが空では登録できないこと
    it 'is invalid without a first_name' do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include('を入力してください')
    end

    # 10. last_name_kanaが空では登録できないこと
    # it "is invalid without a last_name_kana" do
    #   user = build(:user, last_name_kana: nil)
    #   user.valid?
    #   expect(user.errors[:last_name_kana]).to include("can't be blank")
    # end

    # 11. first_name_kanaが空では登録できないこと
    # it "is invalid without a first_name_kana" do
    #   user = build(:user, first_name_kana: nil)
    #   user.valid?
    #   expect(user.errors[:first_name_kana]).to include("can't be blank")
    # end

    # 12. birthdayが空では登録できないこと
    # it "is invalid without a birthday" do
    #   user = build(:user, birthday: nil)
    #   user.valid?
    #   expect(user.errors[:birthday]).to include("can't be blank")
    # end
  end
end
