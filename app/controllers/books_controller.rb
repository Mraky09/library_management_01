class BooksController < ApplicationController
  def index
    @books = Book.in_category(params[:category_id])
      .search(params[:search])
      .order(created_at: :DESC)
      .paginate page: params[:page], per_page: Settings.user.item_per_page
  end

  def show
    @book = Book.find_by id: params[:id]
    @review = Review.new
    @reviews = @book.reviews
  end
end
