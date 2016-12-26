class Admin::BooksController < ApplicationController
  include ApplicationHelper
  before_action :verify_login, :verify_admin
  before_action :load_all_categories, :load_all_authors, :load_all_publishers

  def new
    @book = Book.new
  end

  def create
    @book = Book.new book_params
    byebug
    if @book.save
      flash[:success] = t ".book_add_success"
      redirect_back fallback_location: admin_books_path
    else
      render :new
    end
  end

  private
  def book_params
    params.require(:book).permit :category_id, :title, :description, :author_id,
      :publisher_id, specifications_attributes: [:id, :feature_value,
      :feature_type, :_destroy]
  end

  def load_all_categories
    @categories = Category.all
  end

  def load_all_authors
    @authors = Author.all
  end

  def load_all_publishers
    @publishers = Publisher.all
  end
end
