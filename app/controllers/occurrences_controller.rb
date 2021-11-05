class OccurrencesController < ApplicationController

  def index
    @occurrences = Occurrence.all
  end
end
