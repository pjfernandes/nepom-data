class ShipsController < ApplicationController

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR registration ILIKE :query"
      @ships = Ship.where(sql_query, query: "%#{params[:query]}%")
    else
      @ships = Ship.all
    end
  end

  def show
    @ship = Ship.find(params[:id])
  end

  def new
    @ship = Ship.new
  end

  def create
    @ship = Ship.new(ship_params)
    # @ship.save

    # no need for app/views/ships/create.html.erb
    if @ship.save
      redirect_to ship_path(@ship), notice: 'Embarcação criada com sucesso.'
    else
      render :new
    end
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
    # no need for app/views/ships/destroy.html.erb
    redirect_to ships_path
  end

  def delete_image_attachment
    @ship = Ship.find(params[:id])
    @ship.photo.purge
    # redirect_to ship_path(@ship)
    redirect_to edit_ship_path(@ship)
  end

  private

  def ship_params
    params.require(:ship).permit(:name, :registration, :registration_port, :photo)
  end
end
