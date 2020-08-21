class User < ApplicationRecord
  has_many :microposts,             dependent: :destroy
  has_many :active_relationships,  class_name: "Relationship",
                                  foreign_key: "follower_id",
                                    dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
                                  foreign_key: "followed_id",
                                    dependent: :destroy
  has_many :following,                through: :active_relationships,
                                       source: :followed
  has_many :followers,                through: :passive_relationships,
                                       source: :follower
  has_many :favorites,              dependent: :destroy
  has_many :comments,               dependent: :destroy
  has_many :active_notifications,  class_name: "Notification",
                                  foreign_key: "visitor_id",
                                    dependent: :destroy
  has_many :passive_notifications, class_name: "Notification",
                                  foreign_key: "visited_id",
                                    dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook]
         
  validates :name,      presence: true,
                          length: {maximum: 20}
  validates :user_name, presence: true,
                          length: {maximum: 20}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,     presence: true,
                          length: { maximum: 60 },
                          format: { with:  VALID_EMAIL_REGEX }
                            
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.name
      user.user_name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
  
  def feed
    following_ids = "SELECT followed_id FROM relationships
                     WHERE follower_id = :user_id"
    Micropost.where("user_id IN (#{following_ids}) OR user_id = :user_id", user_id: id)
  end
  
  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end
  
  #フォロー通知
  def create_notification_follow!(current_user)
    notification = current_user.active_notifications.new( visited_id: id,
                                                              action: 'follow')
    notification.save 
  end
end
