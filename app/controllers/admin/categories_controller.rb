class Admin::CategoriesController < ApplicationController
  before_action :verify_login, :verify_admin
  before_action :load_category, except: [:create, :index, :new]

  def index
    @categories = Category.search(params[:search]).includes(:books).
      order(created_at: :DESC).paginate page: params[:page],
      per_page: Settings.item_per_page
    respond_to do |format|
      format.html
      format.xlsx {
        @categories = Category.search(params[:search]).includes(:books).
          order(created_at: :DESC)
        render xlsx: "excel_template", filename: generate_file_name
      }
    end
  end

  def new
    @category = Category.new
  end

  def show
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "category_add_success"
      redirect_back fallback_location: admin_categories_path
    else
      render :new
    end
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

  def destroy
    if @category.books.any?
      flash[:danger] = t "delete_notice"
    else
      if @category.destroy
        flash[:success] = t "delete_success"
      else
        flash[:danger] = t "delete_unsuccess"
      end
    end
    redirect_back fallback_location: admin_categories_path
  end

  private
  def category_params
    params.require(:category).permit :name, :description
  end

  def load_category
    @category = Category.find_by id: params[:id]
    render_404 unless @category
  end

  def generate_file_name
    file_name = "categories_report_"
    file_name + Time.now.strftime('%Y_%m_%d_%H-%M-%S')
  end
end
