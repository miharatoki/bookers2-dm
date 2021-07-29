class SearchsController < ApplicationController
  def search
    @word = params[:word]
    @range = params[:range]
    if @range == "User"
      search = params[:search]
      word = params[:word]
      @users = User.looks(search, word)
      # 　一行にまとめると　 @users = User.looks(params[:search], params[:word])
    else
      search = params[:search]
      word = params[:word]
      @books = Book.looks(search, word)
      #　一行にまとめると  @books = Book.looks(params[:search], params[:word])
    end
  end
end