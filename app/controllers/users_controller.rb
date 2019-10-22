class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to member_or_group_path, success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
  def messages_new
  end
  
  def messages
    to_user_id = params[:to_user_id].to_i
    @messages = Message.where("(from_user_id = ? AND to_user_id = ?) OR (from_user_id = ? AND to_user_id = ?)", current_user.id, to_user_id, to_user_id, current_user.id )
    #binding.pry
    # @messages = Message.where("(from_user_id = 4 AND to_user_id = 5)")
    #binding.pry
  end
  
  def follows_new
  end
  
  # def follows
  #   passive_user_id = params[:passive_user_id].to_i
  #   @follows = Follow.where("(active_user_id = ? AND passive_user_id = ?) OR (active_user_id = ? AND passive_user_id = ?)", current_user.id, passive_user_id, passive_user_id, current_user.id )
  #   #binding.pry
  # end
  
  private
  def log_in(user)
    session[:user_id] = user.id
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  private 
  def member_or_group
  end
  
end