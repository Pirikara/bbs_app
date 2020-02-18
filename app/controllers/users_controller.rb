class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])
    @host_rooms = Room.where(host_id: @user.id)
    messages = Message.where(user_id: @user.id)
    room_ids = []
    messages.each do |m|
      room_ids << m.room_id
    end

    r_ids = room_ids.uniq
    @gest_rooms = Room.where(id: r_ids)
  end
end
