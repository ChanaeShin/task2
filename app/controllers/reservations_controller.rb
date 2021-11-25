class ReservationsController < ApplicationController
  
  def index
    @rooms = Room.all.includes(:reservations)
    @user = User.find(current_user.id)
  end

  def show
    @reservation = Reservation.find(params[:id])
    @room = Room.find(@reservation.room_id)
    @user = User.find(current_user.id)
  end

  def new
    @reservation = Reservation.new
    @user = User.find(current_user.id)
    @room = Room.find(params[:room_id])
    @s_date = params[:start_date]
    @e_date = params[:end_date]
    @day = (@e_date.to_date - @s_date.to_date).to_i
    @people = params[:people]
    @amount = @room.price * @people.to_i * @day
  end

  def create
    
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      last_id = Reservation.last(1)
      flash[:notice] = "Reservation was successfully created."
      redirect_to controller: :reservations, action: :show, id: last_id
    else
      render "reservations"
    end
  end

  private
  def reservation_params 
     params.require(:reservation).permit(:total_amount, :start_date, :end_date ,:user_id,:room_id)
  end

end
