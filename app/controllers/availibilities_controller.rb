class AvailibilitiesController < ApplicationController
  def new

  end

  def create
    @availibility = Availibility.new()
  end

  private
  def set_availibility
    @availibility = Shower.find(params[:id])
  end
  def availibility_params
    params.require(:availibility).permit(:hour, :available)
  end
end
