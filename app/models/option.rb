class Option < ActiveRecord::Base

  belongs_to :question

  has_many :answers, dependent: :nullify

  default_scope { order(:id) }

end
