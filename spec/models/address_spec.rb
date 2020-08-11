require 'rails_helper'

describe Address do
  describe '#create' do
    before do
      @order = build(:address)
    end

    # phone_number、postal_code、form_id、municipalities、streetが存在すれば登録できること
    it 'is valid with a phone_number, postal_code, form_id, municipalities, street' do
      expect(@order).to be_valid
    end

    # phone_numberが空では登録できないこと
    it 'is invalid without a phone_number' do
      @order.phone_number = nil
      @order.valid?
      expect(@order.errors[:phone_number]).to include('を入力してください')
    end

    # postal_codeが空では登録できないこと
    it 'is invalid without a postal_code' do
      @order.postal_code = nil
      @order.valid?
      expect(@order.errors[:postal_code]).to include('を入力してください')
    end

    # municipalitiesが空では登録できないこと
    it 'is invalid without a municipalities' do
      @order.municipalities = nil
      @order.valid?
      expect(@order.errors[:municipalities]).to include('を入力してください')
    end

    # streetが空では登録できないこと
    it 'is invalid without a street' do
      @order.street = nil
      @order.valid?
      expect(@order.errors[:street]).to include('を入力してください')
    end

    # form_idが1では登録できないこと
    it 'is invalid with a form_id has 1' do
      @order.form_id = '1'
      @order.valid?
      expect(@order.errors[:form_id]).to include('は1以外の値にしてください')
    end

    # phone_numberが12文字以上であれば登録できないこと
    it 'is invalid with a phone_number that has more than 12 characters ' do
      @order.phone_number = '123456789000'
      @order.valid?
      expect(@order.errors[:phone_number]).to include('は不正な値です')
    end

    # phone_numberが11文字以下であれば登録できること
    it 'is valid with a phone_number that has less than 11 characters ' do
      @order.phone_number = '1234567890'
      expect(@order).to be_valid
    end

    # postal_codeが'-'を含んでいなければ登録できないこと
    it 'is invalid with a postal_code that dose not have - ' do
      @order.postal_code = '1234567'
      @order.valid?
      expect(@order.errors[:postal_code]).to include('は不正な値です')
    end
  end
end
