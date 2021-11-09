class OccurrencesController < ApplicationController

  # skip_before_action :authenticate_user!, only: :index
  # before_action :get_user, only: :create

  def index
    @occurrences = Occurrence.all
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
      redirect_to user_occurrence_path(@occurrence), notice: 'Occurrence was successfully created!'
    else
      render :new
    end
  end

  private

  def get_user
    @user = User.find(params[:user_id])
  end

  private
  def occurrence_params
    params.require(:occurrence).permit(:ship_id, :latitude, :longitude, :date)
  end

end
