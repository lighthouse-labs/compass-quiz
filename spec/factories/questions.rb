
FactoryGirl.define do
  factory :question do
    question 'The question'
    association :activity
  end
end