class WordsController < ApplicationController

  require 'open-uri'
  require 'nokogiri'


  def define(word)
    @url = "http://www.dictionaryapi.com/api/v1/references/collegiate/xml/" + word.spelling.to_s + "?key=" + ENV["API_KEY"]
    @xml_doc = Nokogiri::XML(open(@url))
    @definitions = @xml_doc.xpath("//dt")
    @definitionOne = @definitions[0].to_s[5..-6]
    if @definitionOne == nil
      return false
    else
      return @definitionOne
    end
  end

  def create_association(word)
    @user = User.find_by_id(session[:id])
    @user.words << word
  end

  def create
    @word = Word.find_by spelling: params["spelling"]
    if @word == nil
      @word = Word.new(spelling: params["spelling"])
      if define(@word) == false
        flash[:wordalert] = "Word Could Not be found"
        redirect_to dashboard_path
        return false
      else
      @word.definition = @definitionOne
      @word.save
      create_association(@word)
      end
    else
      @association = UsersWord.where(:user_id => session[:id], :word_id => @word.id)
      if @association == []
        print @association
        create_association(@word)
      else
        print "You already entered that word!"

      end
    end
      redirect_to dashboard_path
  end

  def destroy
    @user = User.find_by_id(session[:id])
    @word = Word.find_by_id(params[:id])
    @user.words.delete(@word)
    redirect_to dashboard_path
  end

  private
  ## Strong Parameters
  def user_params
    params.require(:word, :user_id).permit(:spelling, :definition)
  end

end
