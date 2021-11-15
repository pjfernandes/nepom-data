class CrewsController < ApplicationController

  def index

    ship_id_temp = params[:ship_id]

    if ship_id_temp != nil
      @ship_id = ship_id_temp
    end

    sql_query_initial = "ship_id = #{@ship_id} AND member_id IS NOT NULL AND date_ini IS NOT NULL AND date_fin IS NOT NULL"
    sql_query_date_ini = ""
    sql_query_date_fin = ""

    if params[:query_date_ini].present?
      sql_query_date_ini = " AND date_ini >= '#{ Date.parse(params[:query_date_ini]) }' "
    end

    if params[:query_date_fin].present?
      sql_query_date_fin = " AND date_fin <= '#{ Date.parse(params[:query_date_fin]) }' "
    end

    sql_query_final = sql_query_initial + sql_query_date_ini + sql_query_date_fin



    @crews = Crew.joins(:member).where(sql_query_final)

    if params[:query_name].present?
      @crews = @crews.where( "name ILIKE ?", "%#{params[:query_name]}%")
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
