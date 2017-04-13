class DepartmentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    @departments = Department.page(params[:page]).per(params[:per_page])
  end

  def new
  end

  def create
    department = Department.new(name: params[:department_name])
    if department.save
      render json: { code: 0 }
    else
      render json: { code: -1, msg: error_msg(department.errors.messages) }
    end
  end

  def destroy
    @department = Department.find(params[:id])

    if @department.user_count.to_i > 0
      flash[:danger] = "部门下有员工，不能删除！"
    else
      @department.destroy
    end

    redirect_to departments_path
  end

  private
  def error_msg(msgs)
    msgs.values.flatten.join("<br>")
  end
end
