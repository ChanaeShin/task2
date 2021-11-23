class ReservationsController < ApplicationController
  
  def index
    #ポイントは一対多で考えること
    @rooms = Room.all.includes(:reservations)
  end

  def show
    @reservation = Reservation.find(params[:id])
    @room = Room.find(@reservation.room_id)
  end

  def new
    @reservation = Reservation.new
    # ?utf8=✓&start_date=2021-11-15&end_date=2021-11-19&people=2&room_id=1&commit=予約する
    # 上のroom_idを取ってきている
    @room = Room.find(params[:room_id])
    @s_date = params[:start_date]
    @e_date = params[:end_date]

    #日付型にして引き算、その後数値型に変換
    @day = (@e_date.to_date - @s_date.to_date).to_i
   
    @people = params[:people]
    @amount = @room.price * @people.to_i * @day
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      # Reservation.last(1) は登録直後の予約IDを取得して詳細画面へ遷移するときに使用
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
