class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  def index
    @beginner = Room.beginner.limit(5)
    @news = Room.news.limit(5)
    @hobby = Room.hobby.limit(5)
    @consultation = Room.consultation.limit(5)
    @healing = Room.healing.limit(5)
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)

    @room.host_id = current_user.id

    if @room.save
      # 初回メッセージの自動投稿
      Message.create(room_id: @room.id, user_id: current_user.id, content: "＊自動投稿＊ 「#{@room.title}」を作成しました")
      redirect_to room_path(@room.id)
    else
      @errors = @room.errors.keys.map { |key|[key, @room.errors.full_messages_for(key)]}.to_h
      render :new
    end
  end

  def show
    @message = Message.new
    #@roomにひもづくメッセージとそのユーザーを取得
    @messages = @room.messages.includes(:user)
  end

  def edit
  end

  def update
    if @room.update(room_update_params)
      redirect_to room_path(@room.id)
    else
      render :edit
    end
  end

  def destroy
    if @room.destroy
      redirect_to user_path(current_user.id)
    else
      redirect_to user_path(current_user.id)
      :javascript
        alert('削除できませんでした。');
    end
  end

  def search
    @rooms = Room.search(params[:keyword])
    @keywords = params[:keyword]
  end

  private

  def room_params
    params.require(:room).permit(
      :image,
      :title,
      :description,
      category_ids:[]
    )
  end

  def room_update_params
    params.require(:room).permit(
      :image,
      :title,
      :description,
      category_ids:[]
    )
  end

  def set_room
    @room = Room.find(params[:id])
  end

end
