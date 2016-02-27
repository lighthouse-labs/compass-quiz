
FactoryGirl.define do
  factory :submission do
    transient do
        quiz :quiz
    end
    before :build do |submission, evaluate|
      create(:quiz, :with_questions, questions_count: 5)

    end
  end
end