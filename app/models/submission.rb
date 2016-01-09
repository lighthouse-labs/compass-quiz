class Submission < ActiveRecord::Base

  belongs_to :student

  has_many :answers, dependent: :destroy

  belongs_to :quiz

  accepts_nested_attributes_for :answers

  default_scope { includes(:student).joins(:student).order('students.github_username') }

  before_validation on: :create do
    unless uuid
      self.uuid = SecureRandom.uuid
    end
  end

  def to_param
    uuid
  end

  def score
    "#{correct} / #{quiz.questions_count}"
  end

  def percent
    (correct.to_f / quiz.questions_count * 100).floor
  end

  def correct
    @correct ||= answers.where(options: {correct: true}).count
  end

  def option_selected?(option)
    @option_selected_memo ||= {}
    option_id = option.is_a?(Option) ? option.id : option
    unless @option_selected_memo.has_key?(option_id)
      @option_selected_memo[option_id] = answers.map(&:option_id).include?(option_id)
    end
    @option_selected_memo[option_id]
  end

end
