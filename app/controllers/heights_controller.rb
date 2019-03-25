class HeightsController < ApplicationController
  def animal
    @guess = Guess.new(height_params)
    @result = @guess.guess_animal(@guess.height, @guess.weight, @guess.bias)
    render :layout => false
  end

  private
  def height_params
    params.permit(:height, :weight)
  end
end
