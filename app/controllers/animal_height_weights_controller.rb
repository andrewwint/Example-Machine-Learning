class AnimalHeightWeightsController < ApplicationController
  def index
    @animals = AnimalHeightWeight.new
  end
end
