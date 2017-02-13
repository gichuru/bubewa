class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable,
        :omniauthable, :omniauth_providers => [:facebook]
    has_many :reviews, dependent: :destroy
    validates :first_name, :last_name, presence: true
    acts_as_voter
  
    has_many :notifications, foreign_key: :recipient_id

    def self.from_omniauth(auth)
        user = where(provider: auth.provider, uid: auth.uid).first_or_initialize
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name
        user.first_name = auth.info.name.split[0]
        user.last_name = auth.info.name.split[1]
        user.save

        puts '#### first_name', auth
            # user.image = auth.info.image
        return user
    end
end
