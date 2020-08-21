class Micropost < ApplicationRecord
  belongs_to :user
  has_many :favorites,    dependent: :destroy
  has_many :favorite_users, through: :favorites,
                             source: :user
  has_many :comments,     dependent: :destroy
  has_many :notifications,dependent: :destroy
  has_one_attached :image 
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :image,   content_type: { in: %w[image/jpeg image/png],
                                      message: "jpgまたはpngの画像を添付してください" },
                      size:         { less_than: 5.megabytes,
                                      message: "5MB以下のファイルを選んでください" }
  #validateメソッド使用してpresenceの時のエラーメッセージを変更
  validate :image_presence 
  
  def image_presence
    unless image.attached?
      errors.add(:image, 'を添付してください')
    end
  end
  
  #正方形・中央
  def display_image
    image.variant(combine_options:{resize:"300x300^",crop:"300x300+0+0",gravity: :center}).processed
  end
  
  #micropostお気に入り登録
  def like(user)
    favorites.create(user_id: user.id)
  end
  
  #micropostのお気に入り削除
  def unlike(user)
    favorites.find_by(user_id: user.id).destroy
  end
  
  #現在のユーザーがすでにお気に入り登録していたらtrueを返す
  def like?(user)
    favorite_users.include?(user)
  end
  
  def create_notification_like!(current_user)
    notification = current_user.active_notifications.new( micropost_id: id,
                                                            visited_id: user_id,
                                                                action: 'like'    )
    notification.save 
  end
  
  def create_notification_comment!(current_user, comment_id)
    #投稿にコメントしているユーザーIDのリストを取得・自分のコメントは除外・重複した場合は削除
    temp_ids = Comment.select(:user_id).where(micropost_id: id).where.not(user_id: current_user.id).distinct
    #取得したユーザーへ通知を作成。（user_idのみ繰り返し取得）
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new( micropost_id: id,
                                                            comment_id: comment_id,
                                                            visited_id: visited_id,
                                                                action: 'comment'   )
                                                                
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
