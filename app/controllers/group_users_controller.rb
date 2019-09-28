class GroupUsersController < ApplicationController
  def index
    @group_users = GroupUser.all
  end
    
  def new
    @group_user = GroupUser.new
  end
  
  def create
    
    @group_user = GroupUser.new(group_user_params)
    @group_user.user_id = current_user.id
    if @group_user.save
      redirect_to new_group_user_path, success: '登録に成功しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
  def show
    @group_user_show = GroupUser.find(params[:id])
  end
  
  def edit
    @group_user = GroupUser.find_by(user_id:params[:id])
  end
  
  def update
    @group_user = GroupUser.find(params[:id])
    if @group_user.update(group_user_params)
      redirect_to group_user_path, success: 'プロフィールを更新しました'
    else
      flash.now[:danger] = "更新に失敗しました"
      render :edit
    end
  end
  
  private
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def group_user_params
    params.require(:group_user).permit(:image, :name, :gender, :prefectures, :part, :genre, :artist, :url, :description, :years_old)
  end
end
