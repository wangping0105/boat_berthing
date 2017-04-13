class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])

    render 'new'
  end

  def create
    @user = User.new(user_params.merge(password: User::DEFAULT_PASSWORD))
    department =  @user.build_user_department(department_id: params[:department_id])

    if @user.save
      department.save

      flash[:success] = '添加成功'
      redirect_to user_managements_path
    else
      flash[:danger] = @user.errors.full_messages
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(user_params)
    @user.password = params[:password] if params[:password]

    if @user.save
      @user.user_department.update(department_id: params[:department_id])

      flash[:success] = '更新成功'
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
