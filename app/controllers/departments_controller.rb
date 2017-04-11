class DepartmentsController < ApplicationController
  def index
    @departments = Department.page(params[:page]).per(params[:per_page])
  end

  def new
  end
end
