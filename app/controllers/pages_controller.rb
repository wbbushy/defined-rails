class PagesController < ApplicationController

  def main
    @user = User.new
    @words = Word.all
  end

end
