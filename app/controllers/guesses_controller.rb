class GuessesController < ApplicationController

  def index
  end

  def new
      @guess = Guess.new
  end

  def create
    @guess = Guess.new(post_params)
    #if @guess.save
    #  redirect_to action: :index
    #end
  end

  private
  def post_params
    params.require(:post).permit(:pet, :height, :weight, :answer)
  end

end
