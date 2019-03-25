class AnimalHeightWeightsController < ApplicationController
  def index
    @animals = AnimalHeightWeight.new
  end

  private
  def guess_params
    params.permit(:height, :weight, :animal_height_weight)
  end
end
