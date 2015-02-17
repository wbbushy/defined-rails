class WordsController < ApplicationController

  def create
    @word = Word.new(spelling: params["spelling"])
    @word.user_id = session[:id]
    @word.save
    redirect_to main_path
  end


  private
  ## Strong Parameters
  def user_params
    params.require(:word, :user_id).permit(:spelling, :definition)
  end

end
