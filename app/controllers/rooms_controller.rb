class RoomsController < ApplicationController
  
  def index
    @rooms = Room.all
  end
  
  def new
    @room = Room.new
  end
 
  def create
    @room = Room.new(params.require(:room).permit(:name, :intro, :price, :address, :image))
      if @room.save
        flash[:notice] = "Room was successfully created."
        redirect_to :rooms
      else
        render "new"
      end
      
  end
 
  def show
    @room = Room.find(params[:id])
  end
 
  def edit
  end
 
  def update
  end
 
  def destroy
  end
  
  private

  def room_params
    params.require(:room).permit(:image)
  end


  def preload
    today = Date.today
    reservations = @room.reservations.where("start_date >= ? OR end_date >= ?", today, today)
    render json: reservations
  end
  
  #　予約 終了日のAJAX
  def preview
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])
    output = {
      conflict: is_conflict(start_date, end_date, @room)
    }
    render json: output
  end
end
