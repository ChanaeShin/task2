class RoomsController < ApplicationController
  
  def index
    @user = User.all
    @user = User.find(current_user.id)
    @rooms = Room.all
  end

  def posts
    @user = User.all
    @user = User.find(current_user.id)
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @user = User.find(current_user.id)
  end

  def search
    @user = User.find(current_user.id)
    area = params[:area]
    keyword  = params[:keyword]
    @rooms = Room.where( "address LIKE ? OR name LIKE ? ", "#{area}", "#{keyword}")
    @room_cnt = Room.where( "address LIKE ? OR name LIKE ? ", "#{area}", "#{keyword}").count
  end

  def new
    @user = User.find(current_user.id)
    @room = Room.new
  end

  def create
    @user = User.find(current_user.id)
    @room = Room.new(room_params)
      if @room.save
        flash[:notice] = "Room was successfully created."
        last_id = Room.last(1)
        redirect_to controller: :rooms, action: :show, id: last_id
      else
        render "new"
      end
  end

  private
  def room_params
    params.require(:room).permit(:name, :content, :price, :address, :image, :user_id)
  end

end

