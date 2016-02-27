
FactoryGirl.define do
  factory :cohort do
    name 'The cohort'
    compass_install 'test'
    compass_primary_key 1234
    trait :cohort_with_students do
      after :create do |cohort|
        FactoryGirl.create_list(:student, 3, cohort: cohort )
      end
    end
  end
end