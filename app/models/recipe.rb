class Recipe < ActiveRecord::Base

  validates :title, :presence => true
  validates :cuisine, :presence => true
  validates :description, :presence => true
  validates :ingridients, :presence => true
  validates :preparation, :presence => true


  mount_uploader :image, ImageUploader
  has_many :favorites
  belongs_to :user

end
