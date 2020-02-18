require 'rails_helper'

describe Message do
  describe '#create' do
    it '内容が無いと送信できない' do
      message = build(:message, content: "")
      message.valid?
      expect(message.errors[:content]).to include("を入力してください")
    end

    it 'ユーザーidが無いと送信失敗する' do
      message = build(:message, user_id: "")
      message.valid?
      expect(message.errors[:user_id]).to include("を入力してください")
    end

    it 'ルームidが無いと送信失敗する' do
      message = build(:message, room_id: "")
      message.valid?
      expect(message.errors[:room_id]).to include("を入力してください")
    end
  end
end
