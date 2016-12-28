class Admin::RequestsController < ApplicationController
  def index
    @requests = Request
      .includes(:book, :user)
      .order(created_at: :DESC)
      .paginate page: params[:page], per_page: Settings.item_per_page
  end
end
