class ReservationsController < ApplicationController

  before_action :set_reservation, only: [:new, :create, :show]

  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
    @hash = Gmaps4rails.build_markers(@shower) do |shower, marker|
      marker.lat shower.latitude
      marker.lng shower.longitude
    end
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


# 1) when you create a new reservation - it needs to find the times available (:availability) - in AvailabilityController, it's defined by finding the shower id in def set_reservation, then -->
# @availibility = Availibility.find(reservation_params[:availibility])

# 2) then it needs the reservation time that was selected -->
# @reservation = Reservation.new(reservation_params[:hour])

# 3) reservation id = shower.id

# 4) then reservation is set to the hour chosen -->
# @reservation.hour = @availibility.hour

# 5) then that chosen hour needs to be set to false  and saved -->
    # @availibility.available = false
    # @availibility.save
# 6) then the user who has the reservation is set to current_user -->
    # @reservation.user = current_user

# 7) then if it saves, it'll go to the resrevation page. Otherwise, it'll reload the page -->
    # if @reservation.save
    #     redirect_to shower_reservation_path(@shower, @reservation)
    #   else
    #     render :new
    # end



