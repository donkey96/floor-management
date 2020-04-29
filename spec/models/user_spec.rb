require 'rails_helper'
describe User do
  describe '#create' do
    it "email、password、password_confirmationが存在すれば登録できる" do
      user = build(:user)
      expect(user).to be_valid
    end
    it "emailがない場合は登録できない" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    it "passwordがない場合は登録できない" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
    it "password_confirmationがpasswordと一致しない場合は登録できない" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
    end
  end
end