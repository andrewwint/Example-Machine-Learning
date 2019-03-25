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
    @guess = Guess.new(guess_params)
    # @result = @guess.guess_animal(@guess.height, @guess.weight, @guess.bias)
    render :layout => false
  end

  private
  def guess_params
    params.require(:guess).permit(:pet_guess, :height, :weight, :is_correct)
  end

end
