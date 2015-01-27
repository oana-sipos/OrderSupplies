class User < ActiveRecord::Base
  # Include default devise modules. Others available are: 
  # :confirmable, :lockable, :timeoutable and :omniauthable 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

  #relationships 
  has_many :orders

  # attr_accessible :email, :password, :password_confirmation, :remember_me 
  validates_uniqueness_of :email, case_sensitive: false

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:email => data["email"]).first
    unless user
      user = User.create(name: data["name"],
         email: data["email"],
         password: Devise.friendly_token[0,20])
    end
    user
  end

  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     user.provider = auth.provider
  #     user.id = auth.uid
  #     user.email = auth.info.email
  #     user.password = Devise.friendly_token[0,20]
  #   end 
  # end
end
