require 'rails_helper'


describe Item do

  describe '#create' do
    before do
      @item = build(:item)
      @item.image = fixture_file_upload("/files/test_image.jpg")
    end


    # 1. image、name、explanation、category_id、status_id、delivary_fee_id、delivary_form_id、delivary_days_id、price、user_idが存在すれば登録できること
    it 'is valid with an image, name, explanation, category_id, status_id, delivary_fee_id, delivary_form_id, delivary_days_id, price, user_id' do
      expect(@item).to be_valid
    end
    
    # 2. imageが存在すれば登録できること
    it 'is valid with an image' do
      expect(@item).to be_valid
    end

    # 3. nameが空では登録できないこと
    it 'is invalid without a name' do
      @item.name = nil
      @item.valid?
      expect(@item.errors[:name]).to include('を入力してください')
    end

    # 4. explanationが空では登録できないこと
    it 'is invalid without an explanation' do
      @item.explanation = nil
      @item.valid?
      expect(@item.errors[:explanation]).to include('を入力してください')
    end

    # 5. category_idが1では登録できないこと
    it 'is invalid with a category_id has 1' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors[:category_id]).to include('は1以外の値にしてください')
    end

    # 6. status_idが1では登録できないこと
    it 'is invalid with a status_id has 1' do
      @item.status_id = '1'
      @item.valid?
      expect(@item.errors[:status_id]).to include('は1以外の値にしてください')
    end

    # 7. delivary_fee_idが1では登録できないこと
    it 'is invalid with a delivary_fee_id has 1' do
      @item.delivary_fee_id = '1'
      @item.valid?
      expect(@item.errors[:delivary_fee_id]).to include('は1以外の値にしてください')
    end

    # 8. delivary_form_idが1では登録できないこと
    it 'is invalid with a delivary_form_id has 1' do
      @item.delivary_form_id = '1'
      @item.valid?
      expect(@item.errors[:delivary_form_id]).to include('は1以外の値にしてください')
    end

    # 9. delivary_days_idが1では登録できないこと
    it 'is invalid with a delivary_days_id has 1' do
      @item.delivary_days_id = '1'
      @item.valid?
      expect(@item.errors[:delivary_days_id]).to include('は1以外の値にしてください')
    end

    # 10. priceが空では登録できないこと
    it 'is invalid without price' do
      @item.price = nil
      @item.valid?
      expect(@item.errors[:price]).to include('を入力してください')
    end

    # 11. priceが数値で登録できること
    it 'is valid with price has integer' do
      @item.price = '5000'
      expect(@item).to be_valid
    end

    # 12. priceが300以上9,999,999以下で登録できること
    it 'is valid price more than 300, less than 9,999,999' do
      @item.price = '300'
      expect(@item[:price]).to be_between(300, 9999999).inclusive
    end

    # 13. user_idが空では保存できないこと
    it 'is invalid without user_id' do
      @item.user = nil
      @item.valid?
      expect(@item.errors[:user]).to include("を入力してください")
    end

  end
end