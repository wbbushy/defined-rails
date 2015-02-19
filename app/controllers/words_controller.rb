class WordsController < ApplicationController

  require 'open-uri'
  require 'nokogiri'


  def define(word)
    @url = "http://www.dictionaryapi.com/api/v1/references/collegiate/xml/" + word.spelling.to_s + "?key=" + ENV["API_KEY"]
    @xml_doc = Nokogiri::XML(open(@url))
    @definitions = @xml_doc.xpath("//dt")
    @definitionOne = @definitions[0].to_s[4..-6]
    @definitionOne = @definitionOne.gsub(/(?i)<vi[^>]*>/, "\"")
    @definitionOne = @definitionOne.gsub(/(?i)<\/vi[^>]*>/, "\"")
    @definitionOne = @definitionOne.gsub(/<[^>]*>/,"")
  end


  def create
    @word = Word.new(spelling: params["spelling"])
    @word.user_id = session[:id]
    define(@word)
    @word.definition = @definitionOne
    @word.save
    redirect_to main_path
  end


  private
  ## Strong Parameters
  def user_params
    params.require(:word, :user_id).permit(:spelling, :definition)
  end

end
