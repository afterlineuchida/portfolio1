class MemberUsersController < ApplicationController
  def index
    @member_users = MemberUser.all
    # binding.pry
  end
    
  def new
    @member_user = MemberUser.new
  end
  
  def create
    
    @member_user = MemberUser.new(member_user_params)
    
    @member_user.user_id = current_user.id
    
    if @member_user.save
      redirect_to new_member_user_path, success: '登録に成功しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
  def show
    @member_user_show = MemberUser.find(params[:id])
    # binding.pry
    #.all.includes(:favorite_users, :comments)
  end
  
  def edit
    @member_user = MemberUser.find_by(user_id:params[:id])
  end
  
  def update
    #binding.pry
    @member_user = MemberUser.find(params[:id])
    if @member_user.update(member_user_params)
      redirect_to member_user_path, success: 'プロフィールを更新しました'
    else
      flash.now[:danger] = "更新に失敗しました"
      render :edit
    end
  end
  

  
 
  
  private
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def member_user_params
    params.require(:member_user).permit(:image, :name, :gender, :prefectures, :part, :genre, :artist, :url, :description, :age)
  end
end
