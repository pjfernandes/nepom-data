class OccurrencesController < ApplicationController

  skip_before_action :authenticate_user!, only: :index

  def index
    @occurrences = Occurrence.all
  end
end
