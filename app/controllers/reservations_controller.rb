class ReservationsController < ApplicationController
  
  def index
    @reservations = Reservation.all
    @rooms = Room.all
  end
  
  def new
    @reservation = Reservation.new
    @room = Room.new
  end
 
  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:price, :start_date, :end_date, :people))
        if @post.save
          flash[:notice] = "新規投稿をしました"
          redirect_to "/reservations/show"
        else
          render "reservations"
        end
     
  end
 
  def show
    @user = User.find(params[:id])
    @reservation = Reservation.new
   
  end
 
  def edit
  end
 
  def update
  end
 
  def destroy
  end

end
