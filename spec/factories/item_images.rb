FactoryBot.define do
  factory :item_image do
    image {Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/image.jpg"))}
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
    association :item
  end
end
