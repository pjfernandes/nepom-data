class CrewsController < ApplicationController

  def index
    @crews = Crew.all
    if params[:member_id] != nil
      @member = Member.find(params[:member_id])
    end
    if params[:ship_id] != nil
      @ship = Ship.find(params[:ship_id])
    end
  end

  def new
    @crew = Crew.new()

    if params[:member_id] != nil
      @member = Member.find(params[:member_id])
    end
    if params[:ship_id] != nil
      @ship = Ship.find(params[:ship_id])
    end
  end

  def create

    @crew = Crew.new(crew_params)

    if params[:member_id] != nil
      @member = Member.find(params[:member_id])
      @crew.member_id = @member.id
    end
    if params[:ship_id] != nil
      @ship = Ship.find(params[:ship_id])
      @crew.ship_id = @ship.id
    end

    if @crew.save
      if params[:member_id] != nil
        redirect_to member_crews_path(@member), notice: 'Tripulação criada'
      end
      if params[:ship_id] != nil
        redirect_to ship_path(@ship), notice: 'Tripulação criada'

      end
    else
      render :new
    end
  end

  def show
    @crew = Crew.find(params[:id])
  end

  def edit
    @crew = Crew.find(params[:id])
  end

  def update
    @crew = Crew.find(params[:id])
    @crew.update(crew_params)
    redirect_to crew_path(@crew)
  end

  def destroy
    @crew = Crew.find(params[:id])
    @member = Member.find(@crew.member_id)
    @crew.destroy
    redirect_to member_crews_path(@member)
  end

  private

  def crew_params
    params.require(:crew).permit(:member_id, :ship_id, :date_ini, :date_fin, :role)
  end

end
