class Recipe < ActiveRecord::Base

  mount_uploader :image, ImageUploader
  has_many :favorites
  belongs_to :user

end
