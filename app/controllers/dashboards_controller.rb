class DashboardsController < ApplicationController

  def show
    @users = User.all.page params[:page]
  end
end
