FactoryBot.define do
  factory :comment do
    association :micropost
    user { micropost.user }
    text { "comment" }
  end
end
