# メインのサンプルユーザー
User.create!( name: "Example User",
         user_name: "example",
             email: "example@railstutorial.org",
          password: "foobar",
          password_confirmation: "foobar")

# 追加のユーザー
49.times do |n|
  name  = Faker::Name.name
  user_name = "example#{n+1}"
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!( name: name,
           user_name: user_name,
               email: email,
            password: password,
            password_confirmation: password)
end

#リレーションシップ作成
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }


# マイクロポストを生成
#users = User.order(:created_at).take(6)
#image_path = File.join(Rails.root, "app/assets/images/kitten.jpeg")
#5.times do
 # content = Faker::Lorem.sentence(word_count: 5)
  # 画像と一緒にマイクロポストの初期データを作成
 # users.each { |user|
  #              user.microposts.create!(content: content) }
 #user.microposts.each { |micropost| 
  #        micropost.image.attach(io: File.open(Rails.root.join(image_path)), filename: 'kitten.jpeg') }
#end

#users = User.order(:created_at).take(6)
#6.times do
 # content = Faker::Lorem.sentence(word_count: 5)
  #users.each do |user|
   # user.microposts.create!(content:content)
    #user.microposts.each do |micropost|
     # micropost.image.attach(io: File.open(Rails.root.join('app/assets/images/kitten.jp')), filename: 'kitten.jpg')
    #end#
  #end
#end

#サンプル投稿
#users = User.order(:created_at).take(6)
#image_path = File.join(Rails.root, "app/assets/images/kitten.jpg")
#2.times do
 # content = Faker::Lorem.word
  #users.each { |user|
   # user.microposts.create!(content: content,image: File.new(image_path))
 #}
 #binding.pry
#end

#microposts = Micropost.all
#image_path = File.join(Rails.root, "app/assets/images/kitten.jpg")
#2.times do
 # microposts.each { |micropost|
  #  micropost.image.create!(image: File.new(image_path))
  #}
#end
