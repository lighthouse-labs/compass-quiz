class Submission < ActiveRecord::Base

  belongs_to :student

  has_many :answers, dependent: :destroy

  belongs_to :quiz

  accepts_nested_attributes_for :answers

  scope :stats, -> {
    select('submissions.*', 'options.correct AS options_correct', 'COUNT(answers.id) AS answers_count')
      .group('submissions.id', 'options.correct')
      .joins(:quiz)
      .joins('LEFT JOIN answers ON answers.submission_id = submissions.id')
      .joins('LEFT JOIN options ON answers.option_id = options.id')
      .order('submissions.created_at', 'options.correct')
  }

  before_validation on: :create do
    unless uuid
      self.uuid = SecureRandom.uuid
    end
  end

  def to_param
    uuid
  end

  def option_selected?(option)
    @memo ||= {}
    option_id = option.is_a?(Option) ? option.id : option
    unless @memo.has_key?(option_id)
      @memo[option_id] = answers.map(&:option_id).include?(option_id)
    end
    @memo[option_id]
  end

  def self.average_correct
    correct_answer_submissions = self.select(&:options_correct)
    correct_submissions_count = [correct_answer_submissions.length, 1].max
    correct_answer_sum = correct_answer_submissions.map(&:answers_count).reduce(0, &:+)
    correct_answer_sum.to_f / correct_submissions_count.to_f
  end

end
