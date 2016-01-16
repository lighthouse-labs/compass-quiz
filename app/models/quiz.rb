class Quiz < ActiveRecord::Base

  QUESTIONS_PER_QUIZ = 5

  belongs_to :cohort

  has_many :submissions, dependent: :nullify

  has_and_belongs_to_many :questions

  validates :cohort_id, presence: true

  validates :day, presence: true

  validate do
    errors.add(:questions, "insufficient for a quiz; #{QUESTIONS_PER_QUIZ} needed") if questions.length < QUESTIONS_PER_QUIZ
  end

  before_save do
    self.day = day.upcase if day
  end

  before_validation on: :create do
    unless uuid
      self.uuid = SecureRandom.uuid
    end
    unless questions.length > 0
      questions << Question.unscoped
        .joins(:activity)
        .where(active: true, activities: {compass_install: cohort.compass_install, day: day.upcase})
        .limit(Quiz::QUESTIONS_PER_QUIZ)
        .order('RANDOM()')
    end
  end

  def to_param
    uuid
  end

end
