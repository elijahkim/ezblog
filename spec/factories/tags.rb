FactoryGirl.define do
  factory :tag do
    sequence(:name) { |n| "lorem-#{n}" }
  end
end
