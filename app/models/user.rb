class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :reviews, dependent: :destroy
  validates :first_name, :last_name, presence: true
  acts_as_voter
  
  has_many :notifications, foreign_key: :recipient_id
end
