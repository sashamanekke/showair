class ShowersController < ApplicationController
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

  end

  def edit
  end
  def update

  end
end
