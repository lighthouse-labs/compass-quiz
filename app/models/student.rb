class Student < ActiveRecord::Base

  belongs_to :cohort

  has_many :submissions, dependent: :nullify

  validates :github_username, presence: true

  default_scope { order(:github_username) }

end
