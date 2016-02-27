FactoryGirl.define do
  factory :quiz do
    trait :with_questions do
    transient do
      questions_count 0
    end
      after :build do |quiz, evaluator|
        create_list(:question, evaluator.questions_count)
      end
    end
    day 2016-01-01
    association :cohort
  end
end
