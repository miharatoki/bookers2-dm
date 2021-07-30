class FavoritesController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id:@book.id)
    begin
     favorite.save!
    rescue ActiveRecord::RecordInvalid => e
     puts e
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id:@book.id)
    favorite.destroy
  end
end