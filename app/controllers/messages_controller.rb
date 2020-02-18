class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room

  def create
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_path(@room.id)
    else
      @messages = @room.messages.includes(:user)
      redirect_to room_path(@room.id)
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
  
  def set_room
    @room = Room.find(params[:room_id])
  end
end
