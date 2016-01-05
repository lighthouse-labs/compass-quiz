class Submission < ActiveRecord::Base

  belongs_to :student

  has_many :answers

  belongs_to :quiz

end
