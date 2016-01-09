class Question < ActiveRecord::Base

  belongs_to :activity

  has_many :options, dependent: :destroy

  accepts_nested_attributes_for :options, allow_destroy: true

  has_and_belongs_to_many :quizzes

  validates :question, presence: true

  validates :activity_id, presence: true

  after_save :ensure_one_option

  default_scope { joins(:activity).order('activities.compass_install, activities.day, activities.title, questions.created_at') }

  protected

  def ensure_one_option
    options.create(correct: true) if options.count == 0
  end

end
