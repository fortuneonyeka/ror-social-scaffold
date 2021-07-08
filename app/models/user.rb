class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }
  validates :password_confirmation, presence: true

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :inviter_request, class_name: 'FriendshipRequest',
                             foreign_key: 'inviter_id',
                             dependent: :destroy

  has_many :invitees, through: :inviter_request

  has_many :invitee_request, class_name: 'FriendshipRequest',
                             foreign_key: 'invitee_id',
                             dependent: :destroy
  has_many :inviters, through: :invitee_request
end
