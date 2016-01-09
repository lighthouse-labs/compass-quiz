class Quiz < ActiveRecord::Base

  QUESTIONS_PER_QUIZ = 5

  belongs_to :cohort

  has_many :submissions, -> { includes(:student).joins(:student).order('students.github_username') }, dependent: :nullify

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

  default_scope { joins(:cohort).order('cohorts.compass_install, cohorts.id, quizzes.day, quizzes.id') }

  def to_param
    uuid
  end

  def average_score
    (submissions.map(&:correct).inject(&:+) / submissions_count.to_f).round(1)
  end

  def average_percent
    (submissions.map(&:percent).inject(&:+) / submissions_count.to_f).floor
  end

  def questions_count
    @questions_count ||= questions.count
  end

  def submissions_count
    @submissions_count ||= submissions.count
  end

end
