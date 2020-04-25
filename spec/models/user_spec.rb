require 'rails_helper'
describe User do
  describe '#create' do
    it "emailがない場合は登録できない" do
      user = User.new(email: "", password:"00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    it "passwordがない場合は登録できない" do
      user = User.new(email: "hogehoge@gmail.com", password:"", password_confirmation: "00000000")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
    it "password_confirmationがpasswordと一致しない場合は登録できない" do
      user = User.new(email: "hogehoge@gmail.com", password:"00000000", password_confirmation: "11111111")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
    end
  end
end