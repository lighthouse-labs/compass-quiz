class Answer < ActiveRecord::Base

  belongs_to :option

  belongs_to :submission

  default_scope { joins(:option).includes(:option) }

end
