class ShowersController < ApplicationController
  def index
  end

  def show

  end

  def destroy
  end

  def new
    @shower = Shower.new
  end
  def create

  end

  def edit
  end
  def update

  end
 def set_params
   params.require(:product).permit(:name, :description, :photo)
 end

end
