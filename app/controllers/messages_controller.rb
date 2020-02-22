class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room

  def create
    @message = @room.messages.new(message_params)
    @my_id = current_user.id
    gon.myid = @my_id
    if @message.save
      respond_to do |format|
        format.html { redirect_to room_path(@room.id) }
        format.json
      end
    else
      @messages = @room.messages.includes(:user)
      @errors = @message.errors.keys.map { |key|[key, @message.errors.full_messages_for(key)]}.to_h
      render template: "rooms/show"
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
