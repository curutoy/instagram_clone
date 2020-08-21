class NotificationsController < ApplicationController
  
  def index
    #current_userに紐づく通知一覧
    @notifications = current_user.passive_notifications
    #通知画面を開くとcheckedをtrueにして通知確認済にする
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end
end
