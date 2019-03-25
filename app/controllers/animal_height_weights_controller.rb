class AnimalHeightWeightsController < ApplicationController
  def index
    @animals = AnimalHeightWeight.new
  end

  def animal
    @guess = Guess.new(guess_params)
    @result = @guess.guess_animal(@guess.height, @guess.weight, @guess.bias)
    render :layout => false
  end

  private
  def guess_params
    params.permit(:height, :weight, :animal_height_weight)
  end

end
