class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params.merge(password: User::DEFAULT_PASSWORD))
    department =  @user.build_user_department(department_id: params[:department_id])

    if @user.save
      department.save

      redirect_to user_managements_path
    else
      flash[:danger] = @user.errors.full_messages
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit([
      :name, :true_name, :phone
    ])
  end
end
