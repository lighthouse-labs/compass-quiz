class Question < ActiveRecord::Base

  belongs_to :activity

  has_many :options

  has_and_belongs_to_many :quizzes

end
