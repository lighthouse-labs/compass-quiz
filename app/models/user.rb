class User < ActiveRecord::Base

  include CreatorTrackable

  has_many :activities_created, class_name: 'Activity', foreign_key: :created_by_user_id, dependent: :nullify

  has_many :quizzes_created, class_name: 'Quiz', foreign_key: :created_by_user_id, dependent: :nullify

  has_many :cohorts_created, class_name: 'Cohort', foreign_key: :created_by_user_id, dependent: :nullify

  has_many :questions_created, class_name: 'Question', foreign_key: :created_by_user_id, dependent: :nullify

  has_many :users_created, class_name: 'User', foreign_key: :created_by_user_id, dependent: :nullify

  has_secure_password

  validates :name, presence: true

  validates :email, presence: true

  default_scope { order(:name) }

end
