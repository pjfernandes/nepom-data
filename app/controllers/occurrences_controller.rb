class OccurrencesController < ApplicationController

  # skip_before_action :authenticate_user!, only: :index
  before_action :get_user

  def index
    @occurrences = Occurrence.all
  end

  # def show

  # end

  # def new
  #   @occurrence = Occurrence.new
  # end

  # def create
  #   @occurrence = Occurrence.new(occurrence_params)
  #   @occurrence.ship = @ship
  #   @occurrence.user = current_user
  #   if @occurrence.save
  #     redirect_to root
  #   else
  #     render :new
  #   end
  # end







  private

  def get_user
    @user = User.find(params[:user_id])
  end
end
