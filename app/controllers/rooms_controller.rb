class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_room, only: [:show, :edit, :destroy]

  def index
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)

    @room.host_id = current_user.id

    if @room.save
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
  end

  def destroy
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

  def set_room
    @room = Room.find(params[:id])
  end

end
