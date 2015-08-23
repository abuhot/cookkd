class Favorite < ActiveRecord::Base

  validates :user_id, :presence => true
  validates :recipe_id, :presence => true, :uniqueness => { :scope => :recipe_id }


  belongs_to :recipe
  belongs_to :user

end
