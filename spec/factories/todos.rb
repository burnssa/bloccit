# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :todo do
    description "MyText"
    days_left 1
    complete false
  end
end
