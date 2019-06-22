FactoryBot.define do
  factory :item_image do
    image             { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/image/something.jpg')) }
    association :item,  factory: :item
  end
end
