FactoryBot.define do
  factory :user do
    id {1}
    name {"Example User"}
    user_name {"example"}
    email {"example@example.com"}
    password {"examplepassword"}
    password_confirmation {"examplepassword"}
  end
  
  factory :other_user, class: "User" do
    id{2}
    name {"Other User"}
    user_name {"other"}
    email {"other@other.com"}
    password {"otherpassword"}
    password_confirmation {"otherpassword"}
  end
  
  factory :other_user2, class: "User" do
    id{3}
    name {"Other User2"}
    user_name {"other2"}
    email {"other2@other.com"}
    password {"other2password"}
    password_confirmation {"other2password"}
  end
end
