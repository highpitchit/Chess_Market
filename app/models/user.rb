class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one_attached :photo
  has_many :forums
  has_many :comments
  has_many :advertises
  after_create :assign_default_role


  def assign_default_role
    add_role :player
  end

end
