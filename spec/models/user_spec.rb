require 'rails_helper'
describe User do
  describe '#create' do
    it "email、password、password_confirmationが存在すれば登録できる" do
      user = build(:user)
      expect(user).to be_valid
    end
    it "emailがない場合は登録できない" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    it "passwordがない場合は登録できない" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
    it "password_confirmationがpasswordと一致しない場合は登録できない" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
    end
    it "重複したemailが存在する場合登録できないこと" do
      user = create(:user, email: "huga@gmail.com")
      another_user = build(:user, email: "huga@gmail.com")
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end
    it "passwordが6文字以上で登録できる" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user).to be_valid
    end
    it "passwordが５文字以下では登録できない" do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end
  end
end