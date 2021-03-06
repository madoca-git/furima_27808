require 'rails_helper'

describe Item do
  describe '#create' do
    before do
      @item = build(:item)
      @item.image = fixture_file_upload('/files/test_image.jpg')
    end

    # 1. image、name、explanation、category_id、status_id、fee_id、form_id、day_id、price、user_idが存在すれば登録できること
    it 'is valid with an image, name, explanation, category_id, status_id, fee_id, form_id, day_id, price, user_id' do
      expect(@item).to be_valid
    end

    # 2. nameが空では登録できないこと
    it 'is invalid without a name' do
      @item.name = nil
      @item.valid?
      expect(@item.errors[:name]).to include('を入力してください')
    end

    # 3. explanationが空では登録できないこと
    it 'is invalid without an explanation' do
      @item.explanation = nil
      @item.valid?
      expect(@item.errors[:explanation]).to include('を入力してください')
    end

    # 4. category_idが1では登録できないこと
    it 'is invalid with a category_id has 1' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors[:category_id]).to include('は1以外の値にしてください')
    end

    # 5. status_idが1では登録できないこと
    it 'is invalid with a status_id has 1' do
      @item.status_id = '1'
      @item.valid?
      expect(@item.errors[:status_id]).to include('は1以外の値にしてください')
    end

    # 6. fee_idが1では登録できないこと
    it 'is invalid with a fee_id has 1' do
      @item.fee_id = '1'
      @item.valid?
      expect(@item.errors[:fee_id]).to include('は1以外の値にしてください')
    end

    # 7. form_idが1では登録できないこと
    it 'is invalid with a form_id has 1' do
      @item.form_id = '1'
      @item.valid?
      expect(@item.errors[:form_id]).to include('は1以外の値にしてください')
    end

    # 8. day_idが1では登録できないこと
    it 'is invalid with a day_id has 1' do
      @item.day_id = '1'
      @item.valid?
      expect(@item.errors[:day_id]).to include('は1以外の値にしてください')
    end

    # 9. priceが空では登録できないこと
    it 'is invalid without price' do
      @item.price = nil
      @item.valid?
      expect(@item.errors[:price]).to include('を入力してください')
    end

    # 10. priceが数値で登録できること
    it 'is valid with price has integer' do
      @item.price = '5000'
      expect(@item).to be_valid
    end

    # 11. priceが300以上9,999,999以下で登録できること
    it 'is valid price more than 300, less than 9,999,999' do
      @item.price = '300'
      expect(@item[:price]).to be_between(300, 9_999_999).inclusive
    end

    # 12. user_idが空では保存できないこと
    it 'is invalid without user_id' do
      @item.user = nil
      @item.valid?
      expect(@item.errors[:user]).to include('を入力してください')
    end
  end
end
