class AnimalHeightWeightsController < ApplicationController
  def index
    @animals = AnimalHeightWeights.new
  end
end
