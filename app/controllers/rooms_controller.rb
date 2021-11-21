class RoomsController < ApplicationController
  
  def index
    @user = User.all
    @rooms = Room.all
  end

  def posts
    @user = User.all
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
  end

  def search
    area = params[:area]
    keyword  = params[:keyword]
    @rooms = Room.where( "address LIKE ? OR name LIKE ? ", "#{area}", "#{keyword}")
    @room_cnt = Room.where( "address LIKE ? OR name LIKE ? ", "#{area}", "#{keyword}").count
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
      if @room.save
        flash[:notice] = "Room was successfully created."
        # Room.last(1) は登録直後の予約IDを取得して詳細画面へ遷移するときに使用
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

