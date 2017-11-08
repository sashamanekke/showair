class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:new, :create]

  def show
  end

  def new
    @reservation = Reservation.new
    @shower = Shower.find(params[:shower_id])

  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.shower = @shower
    @reservation.user = current_user
    if @reservation.save
        redirect_to shower_reservation_path(@shower, @reservation)
      else
        render :new
    end
  end

  private
  def set_reservation
    @shower = Shower.find(params[:shower_id])
  end
  def reservation_params
    params.require(:reservation).permit(:hour)
  end
end
