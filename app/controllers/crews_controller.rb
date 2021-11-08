
class CrewsController < ApplicationController

  def index
    @crews = Crew.all
  end

  def new
    @crew = Crew.new()
  end

  def create
    
    @crew = Crew.new(crew_params)
    
    if @crew.save
      redirect_to crew_path(@crew), notice: 'Crew was successfully created'
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
    @crew.destroy
    redirect_to crews_path
  end
  
  private

  def crew_params
    params.require(:crew).permit(:member_id, :ship_id, :date_ini, :date_fin, :role)
  end

end
