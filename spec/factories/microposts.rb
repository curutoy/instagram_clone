FactoryBot.define do
  factory :micropost do
    id {1}
    content { "example" }
    association :user
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/example.jpg"), 'image/jpg') }
  end 
end
