class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :access_limit
  
  def show
    @user = User.find(params[:id])
    @host_rooms = Room.where(host_id: @user.id)
    messages = Message.where(user_id: @user.id)
    userid = current_user.id
    @gest_rooms = Room.gest_room(messages, userid)
  end

  private

  # 本人以外のマイページを閲覧できない
  def access_limit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(@user.id)
    end
  end
end
