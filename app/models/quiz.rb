class Quiz < ActiveRecord::Base

  belongs_to :cohort

  has_many :submissions

  has_and_belongs_to_many :questions

end
