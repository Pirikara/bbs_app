class Room < ApplicationRecord
  # association
  # has_many :room_user_relations
  # has_many :users, through: :room_user_relations
  belongs_to :host, class_name: "User"
  has_many :room_category_relations, dependent: :destroy
  has_many :categories, through: :room_category_relations
  has_many :messages, dependent: :destroy
  mount_uploader :image, ImageUploader

  # validation
  validates :title,
            :description,
            :category_ids,
            :host_id, presence: true

  # method
  # キーワードを含むmessageが投稿されたroomを検索
  def self.search(search)
    return Room.all unless search
    Room.eager_load(:messages).where('content LIKE(?)', "%#{search}%")
  end

  # gest_room
  # 自分がホストでないトークルーム一覧を取得
  def self.gest_room(messages, userid)
    room_ids = []
    messages.each do |message|
      room_ids << message.room_id
    end

    r_ids = room_ids.uniq
    Room.where(id: r_ids).where.not(host_id: userid)
  end

  # pickupmenu
  # まずはここから
  def self.beginner
    Room.where('title LIKE(?)', "%初心者%").or(Room.where('description LIKE(?)', "%初心者%"))
  end
  # 気になるニュース
  def self.news
    Room.where('title LIKE(?)', "%ニュース%").or(Room.where('description LIKE(?)', "%ニュース"))
  end
  # 趣味・関心
  def self.hobby
    Room.where('title LIKE(?)', "%趣味%").or(Room.where('description LIKE(?)', "%趣味%"))
  end
  # 悩み相談
  def self.consultation
    Room.where('title LIKE(?)', "%相談%").or(Room.where('description LIKE(?)', "%相談%"))
  end
  # 癒し
  def self.healing
    Room.where('title LIKE(?)', "%癒し%").or(Room.where('description LIKE(?)', "%癒し%"))
  end
end