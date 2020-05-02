require 'rails_helper'
describe Customer do
  describe '#create' do
    it '顧客情報が空でも登録できる' do
      customer = build(:customer, name: nil, tel: nil, time: nil, people: nil, text: nil, day: nil)
      expect(customer).to be_valid
    end
  end
end