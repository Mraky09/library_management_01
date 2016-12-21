class Admin::CategoriesController < ApplicationController
  before_action :verify_login, :verify_admin
  def index
    @categories = Category.order(created_at: :DESC).paginate page:
      params[:page], per_page: Settings.item_per_page
  end

  def new
    @category = Category.new
  end

  def show
  end
end
