class FollowsController < ApplicationController
  
  def create
    
    @follow = Follow.new#(follow_params)
    @follow.active_user_id = current_user.id
    @follow.passive_user_id = params[:passive_user_id]
    member_user_id = params[:member_user_id]
    
    
    
    if @follow.save
      redirect_to member_user_path(id: member_user_id), success: 'フォローに成功しました'
    else
      redirect_to member_user_path, danger: 'お気に入りに登録に失敗しました'
    end 
    #binding.pry
   
  end
  
  def destroy
    member_user_id = params[:member_user_id]
    
    follow = Follow.find_by(active_user_id:current_user.id, passive_user_id:params[:passive_user_id])
    #binding.pry
    if follow.destroy
      redirect_to member_user_path(id: member_user_id), success: 'フォローを解除しました'
    else
      redirect_to member_user_path, danger: 'フォローの解除に失敗しました'
    end
    
  end
  
  # private
  # def follow_params
  #   params.require(:follow).permit(:passive_user_id)
  # end
end

