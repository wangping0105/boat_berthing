class UserManagementsController < ApplicationController
  def index
    @users = User.page(params[:page]).per(params[:per_page])
  end
end
