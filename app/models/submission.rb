class Submission < ActiveRecord::Base

  belongs_to :student

  has_many :answers, dependent: :destroy

  belongs_to :quiz

end
