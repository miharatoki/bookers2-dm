class FavoritesController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id:book.id)
    begin
     favorite.save!
     redirect_to request.referer
    rescue ActiveRecord::RecordInvalid => e
     puts e
    end
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id:book.id)
    favorite.destroy
    redirect_to request.referer
  end
end