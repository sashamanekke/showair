class ShowersController < ApplicationController
  before_action :set_shower, only: [:show, :edit, :update, :destroy]
  def index
    @showers = Shower.all
  end

  def show

  end

  def destroy
  end

  def new
    @shower = Shower.new
  end

  def create
    @shower = Shower.new(shower_params)
    puts @shower
    puts shower_params
    # add current user when login is set !!!!!!!!!!!!!!!!
    @shower.user = User.all.sample
    if @shower.save!
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
    params.require(:shower).permit(:title, :description, :address, :price, picture: [], pictures: [])
  end

end
