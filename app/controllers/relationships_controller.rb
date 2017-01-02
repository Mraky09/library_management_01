class RelationshipsController < ApplicationController
  before_action :verify_login, :load_user

  def create
    current_user.follow @user
    redirect_to @user
  end

  def destroy
    current_user.unfollow @user
    redirect_to @user
  end

  private
  def load_user
    @user = User.find_by id: params[:id]
    render_404 unless @user
  end
end
