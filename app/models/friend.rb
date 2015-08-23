class Friend < ActiveRecord::Base

  belongs_to :user , :class_name => "User" , :foreign_key => "friend_id"
end
