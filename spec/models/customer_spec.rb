require 'rails_helper'
describe Customer do
  describe '#create' do
    it '名前が空だと登録できない' do
      customer = build(:customer, name: nil)
      customer.valid?
      expect(customer.errors[:name]).to include("を入力してください")
    end
    it '電話番号が空だと登録でない' do
      customer = build(:customer, tel: nil)
      customer.valid?
      expect(customer.errors[:tel]).to include("を入力してください")
    end
  end
end