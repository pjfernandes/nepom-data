class ShipsController < ApplicationController

  def index
    @ships = Ship.all
  end

  def new
    @ship = Ship.new()
  end

  def create
    @ship = Ship.new(ship_params)

    if @ship.save
      redirect_to ship_path(@ship), notice: 'ship was successfully created.'
    else
      render :new
    end
  end

  def show
    @ship = Ship.find(params[:id])
  end

  def edit
    @ship = Ship.find(params[:id])
  end

  def update
    @ship = Ship.find(params[:id])
    @ship.update(ship_params)
    redirect_to ship_path(@ship)
  end

  def destroy
    @ship = Ship.find(params[:id])
    @ship.destroy
    redirect_to ships_path
  end

  private
  
  def ship_params
    params.require(:ship).permit(:name, :registration, :registration_port)
  end

end
