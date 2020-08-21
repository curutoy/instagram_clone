module NotificationsHelper
  def notification_form(notification)
    #通知を送ってきたユーザーを取得
    @visitor = notification.visitor
    #コメントの内容を通知に表示
    @comment = nil
    @visitor_comment = notification.comment_id
    #notification.actionがfollowかlikeかcommentかで処理変更
    case notification.action
      when "follow" then
        #aタグで通知を作成したユーザーshowのリンクを作成
        tag.a(notification.visitor.name, href: user_path(@visitor), style:"font-weight: bold;")+"があなたをフォローしました"
      when "like" then
        tag.a(notification.visitor.name, href: user_path(@visitor), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href: micropost_path(notification.micropost_id), style:"font-weight: bold;")+"にいいねしました"
      when "comment" then
        #コメントの内容と投稿のタイトルを取得　
         @comment = Comment.find_by(id: @visitor_comment)
         @comment_text = @comment.text 
         tag.a(@visitor.name, href: user_path(@visitor), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href: micropost_path(notification.micropost_id), style:"font-weight: bold;")+"にコメントしました"
    end
  end
  
  #未確認通知
  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end
end
