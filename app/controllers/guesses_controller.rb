class GuessesController < ApplicationController

  def index
  end

  def new
      @guess = Guess.new
  end
  
end
