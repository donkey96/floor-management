require 'rails_helper'
describe Customer do
  describe '#create' do
    it '顧客情報が空でも登録できる' do
      user = create(:user)
      customer = build(:customer)
      expect(customer).to be_valid
    end
  end
end