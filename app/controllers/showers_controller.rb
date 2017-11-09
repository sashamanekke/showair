class ShowersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_shower, only: [:show, :edit, :update, :destroy]
  def index
    @showers = Shower.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@showers) do |shower, marker|
      marker.lat shower.latitude
      marker.lng shower.longitude
      # marker.infowindow render_to_string(partial: "/shower/map_box", locals: { flat: flat })
    end
  end

  def show
    @shower = Shower.find(params[:id])
    @hash = Gmaps4rails.build_markers(@shower) do |shower, marker|
      marker.lat shower.latitude
      marker.lng shower.longitude
      # marker.infowindow render_to_string(partial: "/shower/map_box", locals: { flat: flat })
    end
  end

  def destroy
  end

  def new
    @shower = Shower.new
  end

  def create
    url = "https://www.seniortheatre.com/wp-content/themes/Seniorth/images/noimage.png"
    @shower = Shower.new(shower_params)

    puts @shower
    puts shower_params
    # add current user when login is set !!!!!!!!!!!!!!!!
    @shower.user = current_user
    if @shower.save!
      if @shower.pictures == []
        @shower.picture_urls = [url]
      end
      24.times do |x|
        available = Availibility.new(hour: x, available: false)
        available.shower = @shower
        available.save!
      end
      redirect_to shower_path(@shower)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private
  def set_shower
    @shower = Shower.find(params[:id])
  end
  def shower_params
    params.require(:shower).permit(:title, :description, :address, :price, :picture, pictures: [])
  end

end
