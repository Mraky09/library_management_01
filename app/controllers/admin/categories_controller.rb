class Admin::CategoriesController < ApplicationController
  before_action :verify_login, :verify_admin
  before_action :load_category, except: [:create, :index, :new]

  def index
    @categories = Category.search(params[:search]).order(created_at: :DESC).
      paginate page: params[:page], per_page: Settings.item_per_page
  end

  def new
    @category = Category.new
  end

  def show
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t ".edit_category"
      render :edit
    else
      flash[:danger] = t ".edit_failed"
      render :edit
    end
  end

  private
  def category_params
    params.require(:category).permit :name, :description
  end

  def load_category
    @category = Category.find_by id: params[:id]
    render_404 unless @category
  end
end
