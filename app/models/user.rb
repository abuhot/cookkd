class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


    has_many :friends
    has_many :favorites
    has_many :recipes

    def fullname
      return self.firstname + " " + self.lastname
    end
end
