class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :fullname, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :password, :length => { :minimum => 6 }
  has_secure_password

  has_many :authentications, dependent: :destroy
  has_many :todo_lists, dependent: :destroy



  def self.create_with_auth_and_hash(authentication, auth_hash)
    create! do |u|
      u.fullname = auth_hash["extra"]["raw_info"]["name"]
      u.email = auth_hash["extra"]["raw_info"]["email"]
      u.password = SecureRandom.urlsafe_base64
      u.authentications << (authentication)
    end
  end

  # grab fb_token to access Facebook for user data
  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end
end
