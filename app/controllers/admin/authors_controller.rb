class Admin::AuthorsController < ApplicationController
  before_action :verify_login, :verify_admin
  before_action :load_author, except: [:create, :index, :new]

  def index
    @authors = Author.search(params[:search]).includes(:books)
                .order(created_at: :DESC).paginate page: params[:page],
                per_page: Settings.item_per_page
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new author_params
    if @author.save
      flash[:success] = t ".author_add_success"
      redirect_back fallback_location: admin_authors_path
    else
      render :new
    end
  end

  def update
    if @author.update_attributes author_params
      flash[:success] = t ".edit_author"
      render :edit
    else
      flash[:danger] = t ".edit_failed"
      render :edit
    end
  end

  def destroy
    if @author.books.any?
      flash[:danger] = t "delete_notice"
    else
      if @author.destroy
        flash[:success] = t "delete_success"
      else
        flash[:danger] = t "delete_unsuccess"
      end
    end
    redirect_back fallback_location: admin_authors_path
  end

  private
  def author_params
    params.require(:author).permit :name, :description, :image
  end

  def load_author
    @author = Author.find_by id: params[:id]
    render_404 unless @author
  end
end
