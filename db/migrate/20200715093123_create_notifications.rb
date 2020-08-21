class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.integer :visitor_id, null: false #通知を送ったuserのid
      t.integer :visited_id, null: false #通知を受け取るuserのid
      t.integer :micropost_id            #いいねされたmicropostのid
      t.integer :comment_id              #commentのid
      t.string  :action,  default: '',    null: false #通知の種類（フォロー、お気に入り、コメント）
      t.boolean :checked, default: false, null: false #通知を受け取ったuserが通知を確認したか（default: false)

      t.timestamps
    end
    add_index :notifications, :visitor_id
    add_index :notifications, :visited_id
    add_index :notifications, :micropost_id
    add_index :notifications, :comment_id
  end
end
