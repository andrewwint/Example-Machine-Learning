class GuessesController < ApplicationController

  def index
    @guess = Guess.new
  end

  def show
    @guess = Guess.new
  end

  def create
    @guess = Guess.new(guess_params)

    if @guess.save
      redirect_to "/"
    end
  end

  private
  def guess_params
    params.require(:guess).permit(:pet_guess, :height, :weight, :is_correct)
  end

end
