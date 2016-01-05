class Cohort < ActiveRecord::Base

  has_many :students

  has_many :quizzes

end
