class ShipsController < ApplicationController

  def index
    # if params[:query].present?
    #   sql_query = "name ILIKE :query OR registration ILIKE :query"
    #   @ships = Ship.where(sql_query, query: "%#{params[:query]}%")
    # else
    #   @ships = Ship.last(10)
    # end
    if params[:query]
      @ships = Ship.search_by_ship(params[:query]).reorder('ships.name ASC')
    else
      @ships = Ship.last(10)
    end
  end

  def new
    @ship = Ship.new()
  end

  def create
    @ship = Ship.new(ship_params)

    if @ship.save
      redirect_to ship_path(@ship), notice: 'Embarcação criada com sucesso.'
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

  def delete_image_attachment
    @ship = Ship.find(params[:id])
    @ship.photo.purge
    # redirect_to ship_path(@ship)
    redirect_to edit_ship_path(@ship)
  end

  def new_member
    @ship = Ship.find(params[:id])
    @member = Member.new
  end



private

  def ship_params
    params.require(:ship).permit(:name, :registration, :registration_port, :photo)
  end
end
