class Follow < ApplicationRecord
    belongs_to :follow ,class_name: 'User' ,foreign_key: 'passive_user_id'
    belongs_to :follower ,class_name: 'User' ,foreign_key: 'active_user_id'
   
end
