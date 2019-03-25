class GuessesController < ApplicationController

  def index
    @guess = Guess.new
  end

  def new
    @guess = Guess.new
  end

  def create
    @guess = Guess.new(guess_params)

    if @guess.save
      redirect_to "/"
    end
  end

  def animal
    @guess = Guess.new(process_guess)
    render :layout => false
  end

  private
  def guess_params
    params.require(:guess).permit(:pet_guess, :height, :weight, :is_correct)
  end

  def process_guess
    params.permit(:height, :weight)
  end
end
