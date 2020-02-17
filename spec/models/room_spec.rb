require 'rails_helper'

describe Room do
  describe '#create' do   
    
    it "タイトルが入力されていないと登録できない" do
      room = build(:room, title: "")
      room.valid?
      expect(room.errors[:title]).to include("を入力してください")
    end

    it "説明文が入力されていないと登録できない" do
      room = build(:room, description: "")
      room.valid?
      expect(room.errors[:description]).to include("を入力してください")
    end

    it "ホストユーザーがないと登録できない" do
      room = build(:room, host_id: "")
      room.valid?
      expect(room.errors[:host_id]).to include("を入力してください")
    end

  end
end