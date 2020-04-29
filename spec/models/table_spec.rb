require 'rails_helper'
describe Table do
  describe '#create' do
    it 'テーブル名がある場合登録できる' do
      user = create(:user)
    end
    it 'テーブル名がない場合登録できない' do
      table = build(:table, name: "")
      table.valid?
      expect(table.errors[:name]).to include("を入力してください")
    end
  end
end