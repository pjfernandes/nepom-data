class OccurrencesController < ApplicationController

  # skip_before_action :authenticate_user!, only: :index
  # before_action :get_user, only: :create
  # around_action :set_time_zone, if: :current_user

  def index
    if params[:query_ship]
      @occurrences = Occurrence.search_by_ship(params[:query_ship]).reorder('occurrences.date DESC')
    else
      @occurrences = Occurrence.all.order('occurrences.date DESC')
    end

    @markers = @occurrences.map do |occurrence|
      {
        lat: occurrence.latitude,
        lng: occurrence.longitude,
        info_window: render_to_string(partial: "info_window", locals: { occurrence: occurrence })
      }
    end

  end

  def show
    @occurrence = Occurrence.find(params[:id])
  end

  def new
    @occurrence = Occurrence.new
  end

  def create
    @occurrence = Occurrence.new(occurrence_params)
    @occurrence.user = current_user
    if @occurrence.save
      redirect_to occurrences_path, notice: 'Occurrence was successfully created!'
    else
      render :new
    end
  end

  def edit
    @occurrence = Occurrence.find(params[:id])
  end

  def update
    @occurrence = Occurrence.find(params[:id])
    @occurrence.update(occurrence_params)
    redirect_to occurrence_path(@occurrence)
  end

  private

  def get_user
    @user = User.find(params[:user_id])
  end


  def occurrence_params
    params.require(:occurrence).permit(
      :ship_id, :latitude, :longitude, :date, :time, :ship_origin, :ship_destination, :user_id, :description
    )
  end

  # def set_time_zone(&block)
  #    Time.use_zone(current_user.time_zone, &block)
  # end

end
