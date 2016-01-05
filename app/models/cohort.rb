class Cohort < ActiveRecord::Base

  has_many :students

  has_many :quizzes

  validates :compass_install, presence: true

  validates :compass_primary_key, numericality: { greater_than: 0, only_integer: true }

  validates :name, presence: true

  default_scope { order('compass_install, compass_primary_key DESC') }

end
