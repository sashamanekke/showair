class ReservationsController < ApplicationController

  before_action :set_reservation, only: [:new, :create, :show]

  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
    @availibility = Availibility.find(params[:availibility])
  end

  def create
    @availibility = Availibility.find(reservation_params[:availibility])
    @reservation = Reservation.new(reservation_params[:hour])
    @reservation.shower = @shower
    @reservation.hour = @availibility.hour
    @availibility.available = false
    @availibility.save
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
    params.require(:reservation).permit(:hour, :availibility)
  end
end
