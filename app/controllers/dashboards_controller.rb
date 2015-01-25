class DashboardsController < ApplicationController
  skip_authorization_check

  def show
    @user = current_user
  end
end
